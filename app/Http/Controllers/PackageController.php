<?php

namespace App\Http\Controllers;

use App\Models\Package;
use App\Models\PackageImage;
use App\Models\TempImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Image;

class PackageController extends Controller
{   
    public function index() {
        $packages = Package::all();
        return view('packages.list',compact('packages'));
    }

    public function create() {
        return view('packages.create');
    }

    public function store(Request $request) {
        //print_r($request->post());

        $validator = Validator::make($request->all(),[
            'destination' => 'required',
            'price' => 'required|numeric',
            'duration'=>'required',
            'description'=>'required'
        ]);

        if ($validator->passes()) {

            $package = new Package;
            $package->destination = $request->destination;
            $package->price = $request->price;
            $package->duration = $request->duration;
            $package->description = $request->description;
            $package->save();

            if (!empty($request->image_id)) { 
                $caption = $request->caption;

                foreach ($request->image_id as $key => $imageId) {

                    $tempImage = TempImage::find($imageId);
                    $extArray = explode('.',$tempImage->name);
                    $ext = last($extArray);

                    $packageImage = new PackageImage;
                    $packageImage->name = 'NULL';
                    $packageImage->package_id = $package->id;
                    $packageImage->caption = $caption[$key];
                    $packageImage->save();

                    $newImageName = $packageImage->id.'.'.$ext;
                    $packageImage->name = $newImageName;
                    $packageImage->save();

                    // First Thumbnail
                    $sourcePath = public_path('uploads/temp/'.$tempImage->name);
                    $destPath = public_path('uploads/packages/small/'.$newImageName);
                    $img = Image::make($sourcePath);
                    $img->fit(350,300);
                    $img->save($destPath);

                     // Second Thumbnail
                     $sourcePath = public_path('uploads/temp/'.$tempImage->name);
                     $destPath = public_path('uploads/packages/large/'.$newImageName);
                     $img = Image::make($sourcePath);
                     $img->resize(1200, null, function ($constraint) {
                        $constraint->aspectRatio();
                    });
                    $img->save($destPath);

                }
            }

            $request->session()->flash('success','Package created successfully.');

            return response()->json([
                'status' => true,
                'message' => 'Package added successfully.'
            ]);

        } else {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function edit($package_id, Request $request) {
        $package = Package::find($package_id);
        if ($package == null) {
            return redirect()->route('packages.index');
        }

        $packageImages = PackageImage::where('package_id',$package->id)->get();
        $data['package'] = $package;
        $data['packageImages'] = $packageImages;
        
        return view('packages.edit',$data);
    }

    public function delete($package_id, Request $request) {
        $package = Package::find($package_id);
        $package->delete();
     
        return back()->with('del', "Package deleted successfully");
    }

    public function update($package_id, Request $request) {

        $package = package::find($package_id);
        
        if ($package == null) {
            return response()->json([
                'status' => false,
                'notFound' => true                
            ]);
        }

        $validator = Validator::make($request->all(),[
            'destination' => 'required',
            'price' => 'required|numeric',
            'duration'=>'required',
            'description'=>'required'
        ]);

        if ($validator->passes()) {

            $package->destination = $request->destination;
            $package->price = $request->price;
            $package->duration = $request->duration;
            $package->description = $request->description;
            $package->save();

            if (!empty($request->image_id)) { 
                $caption = $request->caption;
                foreach ($request->image_id as $key => $imageId) {

                    $packageImage = packageImage::find($imageId);
                    $packageImage->caption = $caption[$key];
                    $packageImage->save();

                }
            }

            $request->session()->flash('success','Package updated successfully.');

            return response()->json([
                'status' => true,
                'message' => 'Package updated successfully.'
            ]);

        } else {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

}
