<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Package;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;


class UserController extends Controller
{
    function index()
    {
        return view('register');
    }

    function register(Request $req)
    {
        $data=$req->validate(['name'=>'required',
        'email'=>'required|email',
        'password'=>'required',
        'role'=>'required']);

        $data = new User;
        $data->name=$req->name;
        $data->role=$req->role;
        $data->email=$req->email;
        $data->password=Hash::make($req->password);
        $data->save();
      
        return back()->with('success','You are registered Successfully');
    }

    public function login()
    {
        return view('login');
    }
    public function makelogin(Request $req)
    {
        $credentials=$req->validate([
        'email'=>'required|email',
        'password'=>'required',
        'role' =>'required'
     ]);
         
        if(!Auth::validate($credentials)):
            return redirect()->to('login')
                ->withErrors(trans('auth.failed'));
        endif;

        $user = Auth::getProvider()->retrieveByCredentials($credentials);

        Auth::login($user);
        $packages = Package::all();
        return view('dashboard',compact('user','packages'));
    }

    public function dashboard()
    {
         $packages = Package::all();
        return view('packages.list',compact('packages'));
    }
    public function logout()
    {
        Auth::logout();
        return redirect('login');
    }
}
