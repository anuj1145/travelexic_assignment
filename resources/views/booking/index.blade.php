

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Packages</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="{{ asset('assets/css/dropzone.min.css') }}">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>
<body>

<div class="p-5 bg-primary text-white text-center">
  <h1>TravelExic</h1>
  <p>See the beauty of the world</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a href="{{route('logout')}}" class="nav-link"><i class="fa fa-sign-out"></i> Logout</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container mt-5">
  <div class="row">
    <div class="col-sm-2">
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link" href="{{route('packages.index')}}">Available Packages</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href="{{route('bookings.index')}}">All Bookings</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-10">
    

    <!-- <div class="bg-primary">
        <div class="container py-3">
            <h1 class="text-white">All Bookings</h1>
        </div>
    </div> -->
    <div class="py-5">
        <div class="container">

            <div class="card border-0 shadow-lg ">
                <div class="card-body">
                        <h2 class="pt-2 pb-3">Bookings list</h2>

                    <table class="table table-striped">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Contact No.</th>
                            <th>Arrival Date</th>
                            <th>Departure Date</th>
                            <th>Destination</th>
                            <th>Price</th>
                            <th>Duration</th>
                            <th>Description</th>
                        </tr>
                        @if($bookings->isNotEmpty())
                        @foreach ($bookings as $booking)
                        <tr>
                            <td>{{ $booking->id }}</td>
                            <td>{{ $booking->customer_name }}</td>
                            <td>{{ $booking->contact }}</td>
                            <td>{{ $booking->arr_date }}</td>
                            <td>{{ $booking->dep_date }}</td>
                            <td>{{ $booking->destination }}</td>
                            <td>{{ $booking->price }}</td>
                            <td>{{ $booking->duration }}</td>
                            <td>{{ $booking->description }}</td>
                        </tr>
                        @endforeach
                        
                        @endif
                    </table>
                </div>
            </div>
        </div>
    </div>



    </div>
  </div>
</div>

<div class="mt-5 p-4 bg-dark text-white text-center">
  <p>copyright reserved @2023</p>
</div>

</body>
</html>












