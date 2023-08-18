

<!DOCTYPE html>
<html lang="en">

<head>
  <title>TravelExic Destination</title>
      
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>

<div class="container mt-3 pd-3">
    <div class="row justify-content-center">
        <div class="col-md-4">
        <b>Search for a destination</b>
            <div class="input-group">
                <input type="search" id="search" name="search" class="form-control rounded" placeholder="Search" />
            </div>
        </div>
    </div>
    <hr>
    <!-- <div class="row" id="data">
            @foreach ($packages as $data) 
         <div class="card" style="width: 18rem;">
              <img src="http://localhost\laravel_multiple\public\uploads\packages\small\{{$data->images[0]->name}}" class="card-img-top" alt="">
              <div class="card-body">
            <h5 class="card-title">{{$data->destination}}</h5>
            <p class="card-text">{{$data->description}}</p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item"><b>₹ {{$data->price}}</b></li>
            <li class="list-group-item">A second item</li>
            <li class="list-group-item">A third item</li>
          </ul>
          <div class="card-body">
            <a href="#" class="card-link">Card link</a>
            <a href="#" class="card-link">Another link</a>
          </div>
        </div>
            @endforeach
           </div> -->
    <div class="row" id="">
            <div class="mypackage">
        </div>
    </div>

    <div class="mt-5 p-4 bg-dark text-white text-center">
  <p>copyright reserved @2023</p>
</div>
 
</body>


<script>

    $(document).ready(function () {
        $('#search').on('keyup', function(){
            var value = $(this).val();
            $.ajax({
                type: "get",
                url: "{{route('search_destination')}}",
                data: {'search':value},
                success: function (data) {
                    $('.mypackage').html(data);
                }
            });

        });
    });

</script>

</html>