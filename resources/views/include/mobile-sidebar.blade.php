

<div class="side-nav uk-animation-slide-left-medium user-nav" id="side-nav-wrapper">
    <!--Mobile icon wiill close nav-side   -->
    <span class="uk-animation-fade tm-mobile-close-icon" uk-toggle="target: #side-nav-wrapper; cls: side-nav-active"> <i class="fas fa-times icon-large"></i></span>
    <div id="side-nav">

        @if(Auth::user())
        <div style="background: #f8f8f1" class="uk-grid-small uk-flex-middle uk-margin-small-bottom uk-padding-small" uk-grid>
            <div class="uk-width-3-4">
                <p class="uk-margin-remove-top uk-text-small uk-margin-small-bottom yekan">  {{Auth::user()->name}} </p>
                <p class="uk-margin-remove-bottom uk-margin-small-top uk-text-bold"> {{Auth::user()->email}}  </p>
            </div>

            <div class="uk-width-1-4  uk-first-column">
                <img src="{{user_avatar(Auth::user())}}" alt="Image" class="uk-align-center uk-border-circle">
            </div>
        </div>
        @endif

        <ul class="side-nav-ul overflow-auto" style="height: 400px!important; width: 120%!important;">

            <li>
                <a href="{{url('/')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >خانه</span><span  class="sidebar-icon"><i class="fas fa-home" ></i></span>  </a>
            </li>


         @if(Auth::user())



            <li>
                <a href="{{route('dashboard')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >اطلاعات حساب کاربری</span><span  class="sidebar-icon"><i class="fas fa-info" ></i></span>  </a>
            </li>
<li>
                <a href="{{route('dashboard_edit')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >ویرایش مشخصات</span><span  class="sidebar-icon"><i class="fas fa-edit" ></i></span>  </a>
            </li>
<li>
                <a href="{{route('dashboard.bank.create')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >افزودن حساب بانکی</span><span  class="sidebar-icon"><i class="fas fa-credit-card" ></i></span>  </a>
            </li>
<li>
                <a href="{{route('dashboard_ticket_index')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >تیکت</span><span  class="sidebar-icon"><i class="fas fa-ticket-alt" ></i></span>  </a>
            </li>
<li>
                <a href="{{route('dashboard_notification')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >اطلاعیه ها</span><span  class="sidebar-icon"><i class="fas fa-newspaper" ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('dashboard.membership')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >تقاضا نامه عضویت</span><span  class="sidebar-icon"><i class="fas fa-file-alt" ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('dashboard.partnership')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >درخواست همکاری</span><span  class="sidebar-icon"><i class="fas fa-file-alt" ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('dashboard.wallet.credit.create')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >خرید اعتبار</span><span  class="sidebar-icon"><i class="fas fa-shopping-bag" ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('dashboard.wallet.stock.create')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >خرید اوراق سهام تعاونی</span><span  class="sidebar-icon"><i class="fas fa-file-invoice" ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('dashboard.wallet.point.create')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >تبدیل اعتبار به امتیاز</span><span  class="sidebar-icon"><i class="fas fa-print" ></i></span>  </a>
            </li>

            @else
                <li>
                    <a href=#" uk-toggle="target: #auth-modal"  class="active" >  <span  class="sidebar-title" style="display: inline-block" >ورود | ثبت نام</span><span  class="sidebar-icon"><i class="fas fa-lock" ></i></span>  </a>
                </li>

            @endif
            <li>
                <a href="{{route('blog_index')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >اخبار</span><span  class="sidebar-icon"><i class="fas fa-newspaper" ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('bourse.index')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >بورس</span><span  class="sidebar-icon"><i class="fas fa-money-check" ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('faq')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >سوالات متداول</span><span  class="sidebar-icon"><i class="fas fa-question" ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('page_show' ,['slug'=>'about-us'])}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >درباره ما</span><span  class="sidebar-icon"><i class="fas fa-user-check" ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('page_show' ,['slug'=>'contact-us'])}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >ارتباط با ما</span><span  class="sidebar-icon"><i class="fas fa-address-card" ></i></span>  </a>
            </li>


            <li>
                <a href="{{route('dashboard_ticket_index')}}" class="active" >  <span  class="sidebar-title" style="display: inline-block" >پشتیبانی</span><span  class="sidebar-icon"><i class="fas fa-envelope" ></i></span> </a>
            </li>

            <li>
                <a href="#" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();" class="active" >  <span  class="sidebar-title" style="display: inline-block" >خروج</span><span  class="sidebar-icon"><i class="fas fa-sign-out-alt" ></i></span>  </a>
            </li>


        </ul>

    </div>
</div>





<script>
    $(document).on('click' , '.submenue-toggle' , function(){
        $(this).siblings('.sidebar-submenu:first').slideToggle();
    })
</script>
