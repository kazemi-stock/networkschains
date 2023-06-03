<div class="side-nav uk-animation-slide-left-medium instructor-nav" id="side-nav-wrapper">
    <!--Mobile icon wiill close nav-side   -->
    <span class="uk-animation-fade tm-mobile-close-icon" uk-toggle="target: #side-nav-wrapper; cls: side-nav-active"> <i class="fas fa-times icon-large"></i></span>
    <div id="side-nav">
        <ul class="side-nav-ul">

            <li>
                <a href="{{route('agancy_home')}}" class="active pjax" >  <span  class="sidebar-title" style="display: inline-block" >درخواست های ملک</span><span  class="sidebar-icon"><i class="fas fa-folder-open " ></i></span>  </a>
            </li>
            <li>
                <a href="{{route('agancy_edit')}}" class="active pjax" >  <span  class="sidebar-title" style="display: inline-block" >ویرایش بنگاه</span><span  class="sidebar-icon"><i class="fas fa-edit" ></i></span>  </a>
            </li>

            <li>
                <a href="{{route('agancy_emplye')}}" class="active pjax" >  <span  class="sidebar-title" style="display: inline-block" >کارمندان بنگاه</span><span  class="sidebar-icon"><i class="fas fa-user-plus" ></i></span>  </a>
            </li>


{{--            <li>--}}
{{--                <a href="#" class="submenue-toggle">--}}
{{--                    <span  class="sidebar-title" style="display: inline-block" > آموزش  <i class="fas fa-chevron-down uk-float-left"></i></span><span  class="sidebar-icon"><i class="fas fa-atlas" ></i></span>--}}
{{--                </a>--}}
{{--                <ul class="sidebar-submenu">--}}
{{--                    <li> <a href="#" class="color-blue">ریسورس ها</a> </li>--}}
{{--                        <li>--}}
{{--                            <a href="#" class="pjax">  aa <i class="fas fa-angle-left icon-medium"></i></a>--}}
{{--                        </li>--}}
{{--                </ul>--}}

{{--            </li>--}}


        </ul>

    </div>
</div>

<script>
    $(document).on('click' , '.submenue-toggle' , function(){
        $(this).siblings('.sidebar-submenu:first').slideToggle();
    })
</script>