<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
{{--    <link rel="icon" type="image/png" sizes="16x16" href="{{asset_url('images/favicon.png')}}">--}}
    <title>پنل مدیریت</title>
    <!-- Custom CSS -->
    <link href="{{asset_url('libs/flot/css/float-chart.css')}}" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="{{asset_url('admin/css/bootstrap.min.css')}}" rel="stylesheet">

    <link href="{{asset_url('admin/css/style.min.css')}}" rel="stylesheet">
    <link href="{{asset_url('admin/css/rtl.css')}}" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="{{asset_url('css/jquery-ui-1.10.4.custom.min.css')}}">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
{{--    <!--[if lt IE 9]>--}}
{{--    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>--}}
{{--    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>--}}
{{--    <![endif]-->--}}


    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="{{asset_url('libs/jquery/dist/jquery.min.js')}}"></script>
    <script src="{{asset_url('js/jquery-migrate-1.2.1.min.js')}}"></script>

    <!-- Bootstrap tether Core JavaScript -->
    <script src="{{asset_url('libs/popper.js/dist/umd/popper.min.js')}}"></script>
    <script src="{{asset_url('libs/bootstrap/dist/js/bootstrap.min.js')}}"></script>
    <script src="{{asset_url('libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js')}}"></script>
    <script src="{{asset_url('extra-libs/sparkline/sparkline.js')}}"></script>
    <!--Wave Effects -->
    <script src="{{asset_url('js/waves.js')}}"></script>
    <!--Menu sidebar -->
    <script src="{{asset_url('js/sidebarmenu.js')}}"></script>
    <!--Custom JavaScript -->
    <script src="{{asset_url('js/custom.min.js')}}"></script>
    <!--This page JavaScript -->
    <!-- <script src="../../dist/js/pages/dashboards/dashboard1.js"></script> -->
    <!-- Charts js Files -->
    <script src="{{asset_url('libs/flot/excanvas.js')}}"></script>
    <script src="{{asset_url('libs/flot/jquery.flot.js')}}"></script>
    <script src="{{asset_url('libs/flot/jquery.flot.pie.js')}}"></script>
    <script src="{{asset_url('libs/flot/jquery.flot.time.js')}}"></script>
    <script src="{{asset_url('libs/flot/jquery.flot.stack.js')}}"></script>
    <script src="{{asset_url('libs/flot/jquery.flot.crosshair.js')}}"></script>
    <script src="{{asset_url('libs/flot.tooltip/js/jquery.flot.tooltip.min.js')}}"></script>
    <script src="{{asset_url('js/pages/chart/chart-page-init.js')}}"></script>
    <script src="{{asset_url('js/global.js')}}"></script>
    <script src="{{asset_url('js/scripts.js')}}"></script>
    <script src="{{asset_url('js/jquery-ui.js')}}"></script>
    <script src="{{asset_url('js/jquery.ui.datepicker-cc.all.min.js')}}"></script>
    <script src="{{asset_url('js/sweetalert2@9.js')}}"></script>

    <script>
        function redate(){

            $(".date").datepicker({
                showOtherMonths:true,
                autoSize: true,
                changeYear: true ,
                dateFormat: 'yy-mm-dd' ,
                yearRange: '1300:1400' ,
                defaultDate: '{{jdate(date('Y-m-d') , 'Y-m-d')}}'
            });


        }
        $(document).ready(function () {
            redate();

        })



    </script>


    @yield('header')
    @yield('styles')

    <style>

        .dark-card { background-color:#1c5ea0 ; color: white ; border: solid 2px #1c5ea0 }
        .dark-card .card-body { background-color: white ; color: #2b2b2b   }

        .dark-card.full-dark a { color:  #e2c492}
        .dark-card.full-dark table , .dark-card.full-dark td , .dark-card.full-dark th   { border-color:  #1c1c1c !important;}
        .dark-card .card-header {
            background-color: #1c5ea0;
            color: white;
            padding: 25px;
        }

    #error-toast , #success-toast { position: fixed; max-width: 500px ; min-width: 300px ;  right: 20px ; bottom: 0px ;  z-index: 99999 ; display: none ; color: black}
        #error-toast a , #success-toast a { color: black}
        a { color: #1c5ea0}
        .red-table td { background-color: #ffc1c1  !important;
            vertical-align: middle;}

        .upload-btn-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }

        .upload-btn-wrapper input[type=file] {
            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
        }
        .breadcrumb {
            justify-content: flex-end;
            flex-direction: row-reverse;
            padding: 0px ;
        }
        .breadcrumb > li { margin-left: 5px }

    </style>



</head>

<body>

@csrf

<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>


<div class="card"  id="error-toast">
    <div class="card-header" style="background-color: #ec475e ; color: black">

        خطا

        <a href="javascript:void(0)" class="float-left" onclick="$(this).parents('.card:first').fadeOut();">
            <i class="mdi mdi-window-close"></i>
        </a>

    </div>
    <div class="card-body" style="background-color: #ff5c73 ; color: black">


    </div>
</div>

<div class="card"  id="success-toast">
    <div class="card-header" style="background-color: #3acc7b ; color: black">

        پیام

        <a href="javascript:void(0)" class="float-left" onclick="$(this).parents('.card:first').fadeOut();">
            <i class="mdi mdi-window-close"></i>
        </a>

    </div>
    <div class="card-body" style="background-color: #4dda8c ; color: black">


    </div>
</div>


<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <header class="topbar" data-navbarbg="skin5">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark" style="direction: rtl">
            <div class="navbar-header" data-logobg="skin5">
                <!-- This is for the sidebar toggle which is visible on mobile only -->
                <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <a class="navbar-brand" href="index.html">
                    <!-- Logo icon -->
                    <b class="logo-icon p-l-10">
                        <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                        <!-- Dark Logo icon -->
                        <img src="{{asset_url('image/logo.png')}}" alt="homepage" class="light-logo" style="height: 50px" />

                    </b>
                    <!--End Logo icon -->
                    <!-- Logo text -->
                    <span class="logo-text">
                             <!-- dark Logo text -->
                             پنل مدیریت

                        </span>
                    <!-- Logo icon -->
                    <!-- <b class="logo-icon"> -->
                    <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                    <!-- Dark Logo icon -->
                    <!-- <img src="../../assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->

                    <!-- </b> -->
                    <!--End Logo icon -->
                </a>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Toggle which is visible on mobile only -->
                <!-- ============================================================== -->
                <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
            </div>

            <!-- ============================================================== -->
            <!-- End Logo -->
            <!-- ============================================================== -->

            <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                <!-- ============================================================== -->
                <!-- toggle and nav items -->
                <!-- ============================================================== -->
                <ul class="navbar-nav float-right ml-auto">
                    <li class="nav-item d-none d-md-block"><a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>
                    <!-- ============================================================== -->
                    <!-- create new -->
                    <!-- ============================================================== -->
                    {{--                    <li class="nav-item dropdown">--}}
                    {{--                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--}}
                    {{--                            <span class="d-none d-md-block">Create New <i class="fa fa-angle-down"></i></span>--}}
                    {{--                            <span class="d-block d-md-none"><i class="fa fa-plus"></i></span>--}}
                    {{--                        </a>--}}
                    {{--                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">--}}
                    {{--                            <a class="dropdown-item" href="#">Action</a>--}}
                    {{--                            <a class="dropdown-item" href="#">Another action</a>--}}
                    {{--                            <div class="dropdown-divider"></div>--}}
                    {{--                            <a class="dropdown-item" href="#">Something else here</a>--}}
                    {{--                        </div>--}}
                    {{--                    </li>--}}
                    {{--                    <!-- ============================================================== -->--}}
                    {{--                    <!-- Search -->--}}
                    {{--                    <!-- ============================================================== -->--}}
                    {{--                    <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>--}}
                    {{--                        <form class="app-search position-absolute">--}}
                    {{--                            <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>--}}
                    {{--                        </form>--}}
                    {{--                    </li>--}}
                </ul>

                <ul class="navbar-nav float-left">
                    <!-- ============================================================== -->
                    <!-- Comment -->
                    <!-- ============================================================== -->
{{--                    <li class="nav-item dropdown">--}}
{{--                        <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-bell font-24"></i>--}}
{{--                        </a>--}}
{{--                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">--}}
{{--                            <a class="dropdown-item" href="#">Action</a>--}}
{{--                            <a class="dropdown-item" href="#">Another action</a>--}}
{{--                            <div class="dropdown-divider"></div>--}}
{{--                            <a class="dropdown-item" href="#">Something else here</a>--}}
{{--                        </div>--}}
{{--                    </li>--}}
                    <!-- ============================================================== -->
                    <!-- End Comment -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Messages -->
                    <!-- ============================================================== -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" id="2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="font-24 mdi mdi-bell" id="global-notification-icon"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right mailbox animated bounceInDown" aria-labelledby="2">
                            <ul class="list-style-none">
                                <li>
                                    <div  id="global-notifications-wrapper">
                                        @include('cp.include.notifications')
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <!-- ============================================================== -->
                    <!-- End Messages -->
                    <!-- ============================================================== -->

                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="{{asset_url('images/users/1.jpg')}}" alt="user" class="rounded-circle" width="31"></a>
                        <div class="dropdown-menu dropdown-menu-right user-dd animated" style="text-align: right ; direction: rtl">
                            <a class="dropdown-item" href="javascript:void(0)">  {{Auth::user()->email}} <i class="ti-user m-r-5 m-l-5"></i></a>
                            <div class="dropdown-divider"></div>


                            <a class="dropdown-item" href="javascript:void(0)">  <i class="mdi mdi-camera-timer m-r-5 m-l-5"></i> لاگین : {{jdate($global_last_login->created_at)}}</a>
                            <div class="dropdown-divider"></div>

                            <a class="dropdown-item" href="javascript:void(0)">  <i class="mdi mdi-numeric-4-box-multiple-outline m-r-5 m-l-5"></i> آیپی : {{$global_last_login->ip}}</a>
                            <div class="dropdown-divider"></div>

                            <a class="dropdown-item" href="javascript:void(0)" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"><i class="fa fa-power-off m-r-5 m-l-5"></i>  خروج </a>
                        </div>
                    </li>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                </ul>

                <!-- ============================================================== -->
                <!-- Right side toggle and nav items -->
                <!-- ============================================================== -->

            </div>


        </nav>
    </header>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <aside class="left-sidebar" data-sidebarbg="skin5">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav" class="p-t-30">

                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{route('cp_index')}}" aria-expanded="false"><span class="hide-menu">  خانه </span><i class="mdi mdi-home"></i></a></li>
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{route('cp.commission')}}" aria-expanded="false"><span class="hide-menu"> کمیسیون</span><i class="fa fa-handshake"></i></a></li>
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{route('cp.crypto')}}" aria-expanded="false"><span class="hide-menu"> پرداخت ها</span><i class="mdi mdi-barcode"></i></a></li>
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{route('cp.withdraw')}}" aria-expanded="false"><span class="hide-menu"> درخواست تسویه</span><i class="mdi mdi-barcode"></i></a></li>

                    <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><span class="hide-menu"> کاربران </span><i class="mdi mdi-account-multiple"></i></a>
                        <ul aria-expanded="false" class="collapse  first-level">
                            <li class="sidebar-item"><a href="{{route('cp_user_index')}}" class="sidebar-link"><span class="hide-menu"> کاربران عضو استخر ها </span><i class="mdi mdi-chevron-left"></i></a></li>
                            <li class="sidebar-item"><a href="{{route('cp.user.unconfirmed')}}" class="sidebar-link"><span class="hide-menu"> کاربران در انتظار تایید </span><i class="mdi mdi-chevron-left"></i></a></li>
                         </ul>
                    </li>
                    <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><span class="hide-menu"> ISB INVEST </span><i class="mdi mdi-credit-card"></i></a>
                        <ul aria-expanded="false" class="collapse  first-level">
                            <li class="sidebar-item"><a href="{{route('cp.invest.index')}}" class="sidebar-link"><span class="hide-menu"> کاربران ISB </span><i class="mdi mdi-chevron-left"></i></a></li>
                            <li class="sidebar-item"><a href="{{route('cp.invest.deposit')}}" class="sidebar-link"><span class="hide-menu"> Deposit </span><i class="mdi mdi-chevron-left"></i></a></li>
                            <li class="sidebar-item"><a href="{{route('cp.invest.withdraw')}}" class="sidebar-link"><span class="hide-menu"> Withdraw </span><i class="mdi mdi-chevron-left"></i></a></li>
                         </ul>
                    </li>

{{--                    @if(in_array('SettingController'  , $global_permissions) || in_array('all'  , $global_permissions))--}}
{{--                    <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><span class="hide-menu"> تنظیمات </span><i class="mdi mdi-settings"></i></a>--}}
{{--                        <ul aria-expanded="false" class="collapse  first-level">--}}
{{--                            <li class="sidebar-item"><a href="{{route('cp_setting_index')}}" class="sidebar-link"><span class="hide-menu"> تنظیمات سایت </span><i class="mdi mdi-chevron-left"></i></a></li>--}}
{{--                            <li class="sidebar-item"><a href="{{route('cp_setting_slider')}}" class="sidebar-link"><span class="hide-menu"> اسلایدر </span><i class="mdi mdi-chevron-left"></i></a></li>--}}
{{--                            <li class="sidebar-item"><a href="{{route('cp.setting.credit')}}" class="sidebar-link"><span class="hide-menu"> پکیج های کردیت </span><i class="mdi mdi-chevron-left"></i></a></li>--}}
{{--                        </ul>--}}
{{--                    </li>--}}
{{--                    @endif--}}

                     <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"  href="#" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();" aria-expanded="false"><span class="hide-menu">  خروج </span><i class="mdi mdi-logout"></i></a>


                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>

                    </li>


                    </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">

        @yield('main')


    </div>
</div>

<div class="modal fade" id="master-modal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title " >  </h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">


            </div>

        </div>
    </div>
</div>


<script>
    check_notifications();
    setInterval(()=>check_notifications() , 10000 )
    function check_notifications(){
        $.post('{{route('cp_notifications')}}' , csrf({}) , function(data){
            data = $.parseJSON(data);
            if(data.stat == 'ok')
            {
                $('#global-notifications-wrapper').html(data.html);
                blink_notification();
            }
        })
    }

    $(document).ready(function(){

        blink_notification();

    })

    function blink_notification() {
        if($('#global-notifications-wrapper').find('.new-notification').length > 0 )
        {
            $('#global-notification-icon').addClass('blink_me');
        }
        else
            $('#global-notification-icon').removeClass('blink_me');

    }





</script>




</body>
</html>
