<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add booking</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/dropzone.min.css') }}">
    <style>
      
    </style>
</head>
<body>
    <!-- <a href="{{route('logout')}}" class="dropdown-item" ><i class="fa fa-sign-out" ></i> Logout</a> -->
    @if(session('done'))
    <div class="alert alert-success">{{session('done')}}</div>
@endif
    <div class="py-5">
        <div class="container">
            <form action="{{route('booknow')}}" method="get">
            <a href="{{route('list')}}" class="nav-link"><i class="fa fa-home"></i> Home</a>
                <div class="card border-0 shadow-lg">
                    <div class="card-body">
                       <?php $dest=json_encode($params['dest']); 
                        $dest= str_replace('"', '', $dest);
                        
                        $pric=json_encode($params['pric']); 
                        $pric= str_replace('"', '', $pric);
                        
                        $dur=json_encode($params['dur']); 
                        $dur= str_replace('"', '', $dur);
                        
                        $des=json_encode($params['des']); 
                        $des= str_replace('"', '', $des);?>

                        <div class="row">
                            <h2 class="pb-3">Book the package</h2>

                            <p>Package Details:</p>
                            <h5>Destination: {{$dest}}</h5> 
                            <h5>Duration: {{$dur}}</h5> 
                            <h5>Description: {{$des}}</h5> 
                            <h5>Price: <b>Rs. {{$pric}}</b> </h5>
                            <hr>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <input type="text" name="customer_name" id="customer_name" value="" placeholder="Enter your name" class="form-control">
                                    <p></p>
                                </div>
                            </div>

                                    <input type="hidden" name="destination" id="destination" class="form-control" value="{{$dest}}">
                                    <input type="hidden" name="price" id="price" class="form-control" value="{{$pric}}">
                                    <input type="hidden" name="duration" id="duration" class="form-control" value="{{$dur}}">
                                    <input type="hidden" name="description" id="description" class="form-control" value="{{$des}}">
                                    
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <input type="number" name="contact" id="contact" value="" placeholder="Enter your mobile number" class="form-control">
                                    <p></p>
                                </div>
                            </div>
            
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <input type="date" name="arr_date" id="arr_date" value="" placeholder="Enter arrival date" class="form-control">
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="mb-3">
                                    <input type="date" name="dep_date" id="dep_date" value="" placeholder="Enter departure date" class="form-control">
                                    <p></p>
                                </div>
                            </div>
        
                        </div>

                    </div>
                </div>

                <div class="my-3 ">
                    <button type="submit" class="btn btn-primary btn-lg w-100">Add</button>
                </div>
            </form>
        </div>
    </div>
    
</body>

<script type="text/javascript">

</script>
</html>