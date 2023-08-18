

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
  <meta name="_token" content="{{ csrf_token() }}">
    <style>
        .image-card{
            position: relative;
        }
        .image-card .btn-danger{
            position: absolute;
            right: 20px;
            top: 20px;
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
   
    <div class="py-5">
        <div class="container">
            @if(Session::has('success'))
            <div class="alert alert-success">{{ Session::get('success') }}</div>
            @endif

            @if(Session::has('error'))
            <div class="alert alert-danger">{{ Session::get('error') }}</div>
            @endif

           <form action="" name="packageForm" id="packageForm" method="post">
                <div class="card border-0 shadow-lg">
                    <div class="card-body">
                        
                        <div class="row">
                            <h2 class="pb-3">Edit package</h2>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <input value="{{ $package->destination }}" type="text" name="destination" id="name" value="" placeholder="Destination" class="form-control">
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <input value="{{ $package->price }}" type="text" name="price" id="price" value="" placeholder="Price" class="form-control">
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <input value="{{ $package->duration }}" type="text" name="duration" id="duration" value="" placeholder="Price" class="form-control">
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <input value="{{ $package->description }}" type="text" name="description" id="description" value="" placeholder="Description" class="form-control">
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h2 class="pb-3 mt-3">Upload Image</h2>
                                <div class="mb-3">
                                    <div id="image" class="dropzone dz-clickable">
                                        <div class="dz-message needsclick">    
                                            <br>Drop files here or click to upload.<br><br>                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" id="image-wrapper">
                            @if($packageImages->isNotEmpty())
                                @foreach ($packageImages as $packageImage)

                                <div class="col-md-3 mb-3" id="package-image-row-{{ $packageImage->id }}">
                                    <div class="card image-card">
                                        <a href="#" onclick="deleteImage({{ $packageImage->id }});" class="btn btn-danger">Delete</a>
                                        <img src="{{ asset('uploads/packages/small/'.$packageImage->name) }}" alt="" class="w-100 card-img-top">
                                        <div class="card-body">
                                            <input type="text" name="caption[]"  value="{{ $packageImage->caption }}" class="form-control"/>

                                            <input type="hidden" name="image_id[]"  value="{{ $packageImage->id }}" class="form-control"/>
                                            
                                        </div>
                                    </div>
                                </div>
                                    
                                @endforeach
                            @endif
                        </div>
                        
                    </div>
                </div>

                <div class="my-3 ">
                    <button type="submit" class="btn btn-primary btn-lg w-100">Update</button>
                </div>
            </form>
        </div>
    </div>

    </div>
  </div>
</div>

<div class="mt-5 p-4 bg-dark text-white text-center">
  <p>Footer</p>
</div>

</body>

<script src="{{ asset('assets/js/jquery-3.6.4.min.js') }}"></script>
<script src="{{ asset('assets/js/dropzone.min.js') }}"></script>

<script type="text/javascript">
    var package_id = {{ $package->id }}
    Dropzone.autoDiscover = false;    
    const dropzone = $("#image").dropzone({ 
      uploadprogress: function(file, progress, bytesSent) {
          $("button[type=submit]").prop('disabled',true);
      },
      url:  "{{ route('package-images.store') }}",
      params: {package_id:package_id},
      maxFiles: 10,
      paramName: 'image',
      addRemoveLinks: true,
      acceptedFiles: "image/jpeg,image/png,image/gif",
      headers: {
          'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
      }, success: function(file, response){
            var html = `<div class="col-md-3 mb-3" id="package-image-row-${response.image_id}">
                            <div class="card image-card">
                                <a href="#" onclick="deleteImage(${response.image_id});" class="btn btn-danger">Delete</a>
                                <img src="${response.imagePath}" alt="" class="w-100 card-img-top">
                                <div class="card-body">
                                    <input type="text" name="caption[]"  value="" class="form-control"/>
                                    <input type="hidden" name="image_id[]" value="${response.image_id}"/>
                                </div>
                            </div>
                        </div>`;
            $("#image-wrapper").append(html);
            $("button[type=submit]").prop('disabled',false);
          this.removeFile(file);            
      }
  });

  
  $("#packageForm").submit(function(event){
    event.preventDefault();
    $("button[type=submit]").prop('disabled',true);
    $.ajax({
        url: "{{ route('packages.update',$package->id) }}",
        data: $(this).serializeArray(),
        method: 'post',
        dataType:'json',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
        },
        success: function(response){
            $("button[type=submit]").prop('disabled',false);


            if(response.status == true) {
                window.location.href="{{ route('packages.index') }}";
            } else {
                var errors = response.errors; 
                if (errors.destination) {
                    $("#destination").addClass('is-invalid')
                    .siblings("p")
                    .addClass('invalid-feedback')
                    .html(errors.destination);
                } else{
                    $("#destination").removeClass('is-invalid')
                    .siblings("p")
                    .removeClass('invalid-feedback')
                    .html("");
                }

                if (errors.price) {
                    $("#price").addClass('is-invalid')
                    .siblings("p")
                    .addClass('invalid-feedback')
                    .html(errors.price);
                } else{
                    $("#price").removeClass('is-invalid')
                    .siblings("p")
                    .removeClass('invalid-feedback')
                    .html("");
                }

                if (errors.duration) {
                    $("#duration").addClass('is-invalid')
                    .siblings("p")
                    .addClass('invalid-feedback')
                    .html(errors.duration);
                } else{
                    $("#duration").removeClass('is-invalid')
                    .siblings("p")
                    .removeClass('invalid-feedback')
                    .html("");
                }

                if (errors.description) {
                    $("#description").addClass('is-invalid')
                    .siblings("p")
                    .addClass('invalid-feedback')
                    .html(errors.description);
                } else{
                    $("#description").removeClass('is-invalid')
                    .siblings("p")
                    .removeClass('invalid-feedback')
                    .html("");
                }

                
                

            }
        }
    });
  });

  function deleteImage(id){
    if (confirm("Are you sure you want to delete?")) {
        var URL = "{{ route('package-images.delete','ID') }}";
        newURL = URL.replace('ID',id)
        
        $("#package-image-row-"+id).remove();

        $.ajax({
            url: newURL,
            data: {},
            method: 'delete',
            dataType:'json',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            },
            success: function(response){
                window.location.href='{{ route("packages.edit",$package->id) }}';
            }
        });
    }
  }

</script>
</html>






