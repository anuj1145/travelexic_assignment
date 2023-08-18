
<title>Dashboard </title>
@include('layout.header')
<body class="sb-nav-fixed">
    @include('layout.topbar')
    <div id="layoutSidenav">
        <div id="layoutSidenav_content">
            <div class="container-fluid px-4">
                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
             
                 @yield('content')


                 @include('layout.footer')
            </div>
           @include('layout.sidebar')
        </div>
       
