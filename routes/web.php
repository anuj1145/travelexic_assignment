<?php

use App\Http\Controllers\PackageController;
use App\Http\Controllers\PackageImageController;
use App\Http\Controllers\TempImageController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\BaseController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::any('/',[UserController::class,'index'])->name('register');
Route::any('/register',[UserController::class,'register'])->name('signup');
Route::get('/login',[UserController::class,'login'])->name('login');
Route::post('/login',[UserController::class,'makelogin'])->name('signin');

Route::group(['middleware'=>'auth'],function(){  
    Route::get('/logout',[UserController::class,'logout'])->name('logout');
    Route::get('/dashboard',[UserController::class,'dashboard'])->name('dashboard');

    Route::get('/packages',[PackageController::class,'index'])->name('packages.index');
    Route::get('/packages/create',[PackageController::class,'create'])->name('packages.create');
    Route::post('/packages',[PackageController::class,'store'])->name('packages.store');
    Route::get('/packages/{package}/edit',[PackageController::class,'edit'])->name('packages.edit');
    Route::post('/packages/{package}',[PackageController::class,'update'])->name('packages.update');
    Route::any('/packages_delete/{package}',[PackageController::class,'delete'])->name('packages.delete');

    Route::any('/temp-images',[TempImageController::class,'store'])->name('temp-images.create');

    Route::post('/package-images',[PackageImageController::class,'store'])->name('package-images.store');
    Route::get('/package-images/{image}',[PackageImageController::class,'destroy'])->name('package-images.delete');

    Route::get('/bookings',[BaseController::class,'bookings_view'])->name('bookings.index');
});
Route::get('/customer', [BaseController::class,'index'])->name('list');
Route::get('search', [BaseController::class,'search_destination'])->name('search_destination');
Route::get('/booknow', [BaseController::class,'booking'])->name('book');
Route::get('/book', [BaseController::class,'make_booking'])->name('booknow');