<?php

namespace App\Http\Controllers;

use App\Models\PackageImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Image;

class PackageImageController extends Controller
{
    public function store(Request $request){
        if (!empty($request->image)) {
            $image = $request->image;
            $ext = $image->getClientOriginalExtension();

            $packageImage = new PackageImage();
            $packageImage->name = 'NULL';
            $packageImage->package_id = $request->package_id;
            $packageImage->save();
            

            $imageName = $packageImage->id.'.'.$ext;
            $packageImage->name = $imageName;
            $packageImage->save();


            // First Thumbnail
            $sourcePath = $image->getPathName();
            $destPath = public_path('uploads/packages/small/'.$imageName);
            $img = Image::make($sourcePath);
            $img->fit(350,300);
            $img->save($destPath);

             // Second Thumbnail
             $destPath = public_path('uploads/packages/large/'.$imageName);
             $img = Image::make($sourcePath);
             $img->resize(1200, null, function ($constraint) {
                $constraint->aspectRatio();
            });
            $img->save($destPath);

            return response()->json([
                'status' => true,
                'image_id' => $packageImage->id,
                'name' => $imageName,
                'imagePath' => asset('uploads/packages/small/'.$imageName)
            ]);
        }
    }

    public function destroy($image_id, Request $request){
        $image = packageImage::find($image_id);
        
        if (empty($image)) {
            $request->session()->flash('error','Image not found');
            return response()->json([
                'status' => false
            ]);
        }

        File::delete(public_path('uploads/packages/small/'.$image->name));
        File::delete(public_path('uploads/packages/large/'.$image->name));

        $image->delete();

        $request->session()->flash('success','Image deleted successfully');
        
        return response()->json([
            'status' => true
        ]);

    }
}
