<?php

namespace App\Http\Controllers;

use App\Models\Package;
use App\Models\PackageImage;
use App\Models\Booking;

use Illuminate\Http\Request;

class BaseController extends Controller
{
  public function index()
  {
    $packages = Package::with(['images'])->get();
    return view('customer.list', compact('packages'));
  }

  public function search_destination(Request $request)
  {
    $search = $request->get('search');

    if ($request->ajax()) {

      $output = '';

      if ($search) {
        $packages = Package::with(['images'])->Where('destination', 'like', '%' . $search . '%')->get();
        $output .= '<div class="row">';
        foreach ($packages as $data) {
          $img_data = $data->images[0]->name;
          $output .= '<div class="card" style="width: 18rem;">
                 <img src="http://localhost\laravel_multiple\public\uploads\packages\small\"' . $img_data . '" class="card-img-top" alt="">';
          $output .= '<div class="card-body">
              <h5 class="card-title">' . $data->destination . '</h5>
              <p class="card-text">' . $data->description . '</p>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item"><b>₹ ' . $data->price . '</b></li>
              <li class="list-group-item">' . $data->duration . '</li>
            </ul>
            <div class="card-body">';
          $output .= '<a href="booknow/?dest=' . $data->destination . '&dur=' . $data->duration . '&pric=' . $data->price . '&des=' . $data->description . '" class="card-link">Book Now</a>
            </div>
          </div>';
        }
        $output .= '</div>';
        return response()->json($output);
      } else {
        $packages = Package::with(['images'])->get();
        $output .= '<div class="row">';
        foreach ($packages as $data) {
          $img_data = $data->images[0]->name;
          $output .= '<div class="card" style="width: 18rem;">
               <img src="http://localhost\laravel_multiple\public\uploads\packages\small\"' . $img_data . '" class="card-img-top" alt="">';
          $output .= '<div class="card-body">
            <h5 class="card-title">' . $data->destination . '</h5>
            <p class="card-text">' . $data->description . '</p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item"><b>₹ ' . $data->price . '</b></li>
            <li class="list-group-item">' . $data->duration . '</li>
          </ul>
          <div class="card-body">';
          $output .= '<a href="booknow/?dest=' . $data->destination . '&dur=' . $data->duration . '&pric=' . $data->price . '&des=' . $data->description . '" class="card-link">Book Now</a>
          </div>
        </div>';
        }
        $output .= '</div>';


        return response()->json($output);
      }
    }

    return view('customer.list');
  }

  public function booking()
  {
    if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')
      $url = "https://";
    else
      $url = "http://";

    $url .= $_SERVER['HTTP_HOST'];
    $url .= $_SERVER['REQUEST_URI'];

    $url_components = parse_url($url);
    parse_str($url_components['query'], $params);

    return view('customer.add_booking',['params'=>$params]);
  }

  public function make_booking(Request $request)
  {
    $data = new Booking;
    $data->customer_name = $request->customer_name;
    $data->contact = $request->contact;
    $data->arr_date = $request->arr_date;
    $data->dep_date = $request->dep_date;

    $data->destination = $request->destination;
    $data->price = $request->price;
    $data->duration = $request->duration;
    $data->description = $request->description;
    $data->save();

    return back()->with('done', "Booking has been made successfully");
  }

  public function bookings_view()
  {
     $bookings=Booking::all();
     return view('booking.index',compact('bookings'));
  }
}
