<div class="uk-width-4-5@m uk-width-1-2@s uk-margin-auto  border-radius-6  auth-page-box uk-margin-large-top"
     style="text-align: right">
    <div class="uk-child-width-1-2@m redius uk-box-shadow-medium uk-background-blue mt-5 uk-grid-collapse" uk-grid>
        <div class="uk-text-middle uk-margin-auto-vertical mt-5 uk-text-center uk-padding-small uk-animation-scale-up">
            <p>
                <img src="{{asset_url('image/logo.png')}}" style="width: auto">

            </p>
            <h1 class=" uk-margin-small" style="color: #f2f2f2">{!! setting($global_setting , 'siteTitle' ) !!}  </h1>
            <br>
            <hr>
            <p class="uk-text-light" style="color: white">با لمس کردن هر یک از تب های ورود به حساب کاربری و یا ثبت نام
                در سایت به صفحه مورد نظر هدایت خواهید شد</p>
        </div>
        <div>
            <div class="uk-card-default uk-padding uk-card-small" style="min-height: 400px;">

                <!-- Login tab tab -->


                <!-- register tab -->
                <div id="register" class="tabcontent tab-default-open animation: uk-animation-slide-left-medium">

                    <div>
                        <ul class="uk-child-width-expand" uk-tab>
                            <li><a href="#">ثبت نام در سایت</a></li>
                            <li class="uk-active"><a href="#">ورود به حساب کاربری</a></li>
                        </ul>
                        <ul class="uk-switcher">
                            <li>
                                @include('auth.register-modal')
                            </li>
                            <li>
                                @include('auth.login-modal')
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<style>.redius{border-radius: 30px!important;}</style>
