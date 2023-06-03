<nav style="display: block !important;  top: 0px ; height: 53px ; width: 100% ; background-color: white  " class="tm-mobile-header    uk-padding-remove-top uk-padding-remove-bottom uk-padding-remove" id="main-navbar" uk-navbar >


    <div class="uk-container  uk-flex" style="height: 100%">

        <!-- mobile icon for side nav on nav-mobile-->
        <span class="uk-hidden@m tm-mobile-menu-icon" uk-toggle="target: #side-nav-wrapper; cls: side-nav-active"><i class="fas fa-bars icon-large"></i></span>
        <!-- mobile icon for user icon on nav-mobile -->
        <span class="uk-hidden@m tm-mobile-user-icon uk-align-right" >


        <a href="{{URL('/')}}" class="uk-padding-remove">
                <img src="{{asset_url('image/logo.png')}}" id="h-pos"  style="max-width: 60px">
        </a>

        </span>
        <!-- mobile logo -->

        <a class="uk-hidden@m uk-logo fs17" href="{{URL('/')}}">
            {!! setting($global_setting , 'siteTitle' ) !!}
        </a>



        <div class="uk-navbar-left uk-padding-remove tm-show-on-mobile uk-flex-left" id="tm-show-on-mobile"  >
            <!-- this will clouse after display user icon -->
            <span class="uk-hidden@m tm-mobile-user-close-icon uk-align-right" uk-toggle="target: #tm-show-on-mobile; cls: tm-show-on-mobile-active"><i class="fas fa-times icon-large"></i></span>

            <ul class="uk-navbar-nav uk-flex-middle">
                <li class="uk-text-black">
                    <span class="uk-button uk-button-default uk-border-rounded uk-button-small" style="border-radius: 20px ; background-color: #5bd9ff ; color: white ; border: none"><i class="fas fa-clock uk-margin-small-right"></i> {{jdate(date('Y-m-d') , 'l d F Y' )}}</span>
                </li>
                <li class="uk-padding-small uk-text-muted ">|</li>
                <li>
                    <a href="{{setting($global_setting , 'SocialInsta' , '#' )}}" target="_blank" class="uk-text-black"><img src="{{asset_url('image/icon-instagram.png')}}"  style="height: 25px ; width: 25px"></a>
                </li>
                <li>
                    <a href="{{setting($global_setting , 'SocialTelegram' , '#' )}}" target="_blank" class="uk-text-black"><img src="{{asset_url('image/icon-telegram.png')}}"  style="height: 25px ; width: 25px"></a>
                </li>
                <li>
                    <a href="{{setting($global_setting , 'SocialWAT' , '#' )}}" target="_blank" class="uk-text-black"><img src="{{asset_url('image/icon-whatsapp.png')}}"  style="height: 25px ; width: 25px"></a>
                </li>

            </ul>
         </div>

        <div class="uk-navbar-center uk-visible@m uk-padding-small " style="z-index: 1 !important; padding-top: 24px ">



        </div>
        <div class="uk-navbar-right uk-visible@m">

            <div class="uk-inline"  id="global-search-wrapper"  >
                <a class="uk-form-icon "  style="font-size: 17px" href="" ><i class="fas fa-search"></i> </a>
                <input class="uk-input" placeholder="جستجو ...." style="height: 38px">
            </div>


        </div>

    </div>

</nav>



<div class="uk-section-small uk-section-default uk-background-gradiant-blue " id="height"  style="background-image: url('{{asset_url('image/header-bg.png')}}'); padding-bottom: 9px !important;">

    <div class="uk-container uk-flex">
        <div class="uk-navbar-left uk-padding-remove tm-show-on-mobile uk-flex-left" id="tm-show-on-mobile" style="margin-left: 110px " >
            <!-- this will clouse after display user icon -->
            <span class="uk-hidden@m tm-mobile-user-close-icon uk-align-right" uk-toggle="target: #tm-show-on-mobile; cls: tm-show-on-mobile-active"><i class="fas fa-times icon-large"></i></span>
            <ul class="uk-navbar-nav uk-flex-middle" style="flex-direction: row-reverse">






                @if(\Auth::user())

                    <li class="mt-5 pt-5">
                        <!-- messages -->
                        <a href="#"  class="relative">
                            <span class="global-notification-counter uk-border-circle user-profile-tiny number  {{$global_unred_tickets > 0 ? '' : 'hidden'}}" >{{$global_unred_tickets > 9 ? '+9' : $global_unred_tickets}}</span>
                            <i class="fas fa-envelope fs30" style="color: white"></i>

                        </a>
                        <div uk-dropdown="pos: bottom-left ;mode : click; animation: uk-animation-slide-left" class="uk-dropdown uk-dropdown-top-right  tm-dropdown-medium border-radius-6 uk-padding-remove uk-box-shadow-large angle-top-left">

                            {{--                        <a href="#" class="uk-position-top-right uk-link-reset"> <i class="fas fa-trash uk-align-right   uk-text-small uk-padding-small"></i> </a>--}}
                            <h5 class="uk-padding-small uk-margin-remove uk-text-bold  uk-text-right"> پیام ها </h5>

                            <hr class=" uk-margin-remove">
                            <div class="uk-text-left uk-height-medium">
                                <div uk-scrollspy="target: > div; cls:uk-animation-slide-bottom-small; delay: 100" data-simplebar>

                                    @foreach($global_tickets as $gticket )
                                        <hr class="uk-margin-remove uk-animation-slide-top-small">

                                        <div class=" uk-padding-small  uk-background-light uk-text-right" tabindex="0">
                                            <div class="uk-flex-middle uk-grid-small uk-grid" uk-grid="">
                                                <div class="uk-width-4-4">
                                                    <p class="uk-margin-remove-bottom uk-text-bold">  </p>
                                                    <p class="uk-margin-remove yekan"> <a class="color-black" href="{{route('dashboard_ticket_show' ,['id'=>$gticket->id])}}"> {{$gticket->title}} </a> </p>
                                                    <p class="uk-margin-remove-top uk-text-small uk-text-muted">{{jdate($gticket->created_at , 'l d/m')}}</p>
                                                </div>
                                            </div>
                                        </div>

                                    @endforeach

                                </div>
                            </div>



                            <hr class=" uk-margin-remove">
                            <h5 class="uk-padding-small uk-margin-remove uk-text-bold uk-text-center"><a class="uk-link-heading" href="{{route('dashboard_ticket_index')}}"> مشاهده همه </a> </h5>
                        </div>
                    </li>
                    <li class="mt-5 pt-5">
                        <!-- Notivications -->


                        <a href="#" class="relative">
                            <span class="global-notification-counter uk-border-circle user-profile-tiny number  {{$global_new_notifications > 0 ? '' : 'hidden'}}" >{{$global_new_notifications > 9 ? '+9' : $global_new_notifications}}</span>

                            <i class="fas fa-bell fs30" style="color:white"></i>

                        </a>
                        <div uk-dropdown="pos: bottom-left ;mode : click; animation: uk-animation-slide-left" class="uk-dropdown uk-dropdown-top-right  tm-dropdown-small border-radius-6 uk-padding-remove uk-box-shadow-large angle-top-left">
                            <a href="javascript:void(0)" data-route="{{route('dashboard_notification_delete' ,['id'=>'all'])}}" class="delete-notification-btn uk-position-top-left uk-link-reset uk-text-left yekan"> <i class="fas fa-trash uk-align-right   uk-text-small uk-padding-small uk-margin-remove-left"> </i></a>

                            <h5 class="uk-padding-small uk-margin-remove uk-text-bold yekan "> اطلاعیه های شما </h5>
                            <hr class=" uk-margin-remove">
                            <div class="uk-padding-smaluk-text-left uk-height-medium ">
                                <div data-simplebar>
                                    <div class="uk-padding-remove" id="notifications-global-wrapper" uk-scrollspy="target: > div; cls:uk-animation-slide-bottom-small; delay: 100 ; repeat: true">

                                        <ul class="uk-margin">


                                            <li class="uk-active">
                                                @foreach( $global_notifications  as $global_notification )
                                                    <div class="uk-flex-middle uk-grid-small" uk-grid>
                                                        <div class="uk-width-3-4">
                                                            <p class="uk-margin-remove yekan"> {{$global_notification->title}}</p>
                                                            <p class="uk-margin-remove-top uk-text-small uk-text-muted tahoma">{{jdate($global_notification->created_at)}}</p>
                                                        </div>
                                                        <div class="uk-width-1-5 uk-flex-first">
                                                            <img src="{{avatar_url($global_notification->Sender)}}" alt="Image" class="uk-border-circle user-profile-tiny">
                                                        </div>
                                                    </div>
                                                @endforeach
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                            <hr class=" uk-margin-remove">
                            <h5 class="uk-padding-small uk-margin-remove uk-text-bold uk-text-center"><a class="uk-link-heading" href="{{route('dashboard_notification')}}"> مشاهده همه </a> </h5>

                        </div>
                    </li>
                    <li class="mt-5 pt-5">
                        <!-- User profile -->
                        <a href="#">
                            <img src="{{user_avatar(Auth::user())}}" alt="avatar" class="uk-border-circle user-profile-tiny">
                        </a>
                        <div uk-dropdown="pos: top-right ;mode : click ;animation: uk-animation-slide-left" class="uk-dropdown  uk-dropdown-top-right  tm-dropdown-small border-radius-6 angle-top-left">
                            <div class="uk-grid-small uk-flex-middle uk-margin-small-bottom" uk-grid>
                                <div class="uk-width-1-4  uk-first-column">
                                    <img src="{{user_avatar(Auth::user())}}" alt="Image" class="uk-align-center uk-border-circle">
                                </div>
                                <div class="uk-width-3-4">
                                    <p class="uk-margin-remove-bottom uk-margin-small-top uk-text-bold"> {{Auth::user()->email}}  </p>
                                    <p class="uk-margin-remove-top uk-text-small uk-margin-small-bottom yekan">  {{Auth::user()->name}} </p>
                                </div>
                            </div>
                            <ul class="uk-list uk-list-bullet">
                                <li>
                                     موجودی اعتبار : {{price(Auth::user()->credit)}}
                                </li>
                                <li>
                                    موجودی امتیاز : {{(Auth::user()->point)}}
                                </li>
                                <li>
                                    کل امتیازات : {{(Auth::user()->total_point)}}
                                </li>
                                <li>
                                    تعداد سهام : {{Auth::user()->stock}}
                                </li>
                                <li>
                                    سود سهام : {{Auth::user()->stock}}
                                </li>
                            </ul>

                            <ul class="uk-nav uk-dropdown-nav">


                                <li class="uk-nav-divider">
                                    <a href="{{route('dashboard.index')}}" class="yekan font-weight-bold ">  داشبورد <i class="fas fa-cog uk-margin-small-left"></i> </a>
                                </li>

                                <li class="uk-nav-divider"></li>
                                <li>
                                    <a href="#" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();" class="yekan font-weight-bold">  خروج <i class="fas fa-sign-out-alt uk-margin-small-left"></i></a>
                                </li>
                            </ul>
                        </div>
                    </li>

                @else

                    <li>
                        <div class="mt-5 pt-5">
                            <a class="uk-button uk-button-white  font-weight-bolder uk-margin-small-right" style="border-radius: 5px !important;" href="{{url('register')}}"> ثبت نام <i class="fas fa-edit uk-margin-small-left"></i> </a>
                            <a class="uk-button uk-button-primary uk-text-white font-weight-bolder" style="border-radius: 5px !important;" href="{{url('login')}}"> ورود<i class="fas fa-key uk-margin-small-left"></i> </a>
                        </div>
                        {{--                        uk-toggle="target: #auth-modal"--}}
                    </li>


                @endif


            </ul>
        </div>

        <div class="uk-navbar-right uk-visible@m" >
            <ul class="uk-navbar-nav uk-flex-middle">
                <li  class="uk-margin-left">
                    <a href="{{URL('/')}}" class="uk-padding-remove">
                        <img src="{{asset_url('image/logo-big.png')}}"  style="height: 130px !important; width:420px !important; ">
                    </a>
                </li>
            </ul>
        </div>

    </div>

</div>
<div style="background-color: #103185 ; height: 50px" class="uk-nav  " id="screen"  >
    <div class="uk-container">
    <nav class=" uk-padding-remove-right uk-visible@m uk-navbar-transparent uk-animation-slide-to  uk-navbar" uk-navbar="" >
        <div class="uk-flex uk-flex-right uk-width-expand">
            <ul class="uk-subnav uk-subnav-2  ">

                <li>
                    <a href="{{route('page_show' ,['slug'=>'contact-us'])}}" class="color-white fs14">  ارتباط با ما </a>
                </li>
                <li>
                    <a href="{{route('page_show' ,['slug'=>'about-us'])}}" class="color-white fs14">  درباره ما </a>
                </li>
                <li>
                    <a href="{{route('faq')}}" class="color-white fs14">  سوالات متداول </a>
                </li>
                <li>
                    <a href="{{route('bourse.index')}}" class="color-white fs14"> بورس </a>
                </li>
                <li>
                    <a href="{{route('blog_index')}}" class="color-white fs14">  اخبار </a>
                </li>
                <li>
                    <a href="{{url('/')}}" class="color-white fs14">  خانه </a>
                </li>

            </ul>
        </div>
    </nav>
    </div>
</div>
<style>
    @media screen and (max-width: 960px){
        #screen{display: none!important;}
        #h-pos{margin-top: 35px!important;}
        #height{height: 130px!important; background-size:260%; background-repeat: no-repeat!important;}
    }
    @media (min-width: 540px) and (max-width: 960px){
        #height{background-size: 160%!important;}
    }
</style>
