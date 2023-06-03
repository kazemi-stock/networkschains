<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="{{asset_url('images/favicon.png')}}">
    <meta name="description" content="">
    <title> authentication </title>
    <!-- Favicon -->
    <link href="{{asset_url('img/brand/favicon.png')}}" rel="icon" type="image/png">

    <!-- Your stylesheet-->
    <link rel="stylesheet" href="{{asset_url('css/uikit.css')}}">
    <link rel="stylesheet" href="{{asset_url('css/main.css')}}">

    <!-- font awesome -->
    <link rel="stylesheet" href="{{asset_url('css/fontawesome.css')}}">
    <link rel="stylesheet" href="{{asset_url('css/rtl.css')}}">

    <!--  javascript -->
    <script src="{{asset_url('js/simplebar.js')}}"></script>
    <script src="{{asset_url('js/uikit.js')}}"></script>
    <script src="{{asset_url('js/jquery.js')}}"></script>
    <script src="{{asset_url('js/jquery-migrate-1.2.1.min.js')}}"></script>
    <script src="{{asset_url('js/global.js')}}"></script>

</head>
<body style="padding-top: 0px !important;">


{{--<nav class="app">--}}

{{--    <!--  Top bar nav -->--}}
{{--    @include('include.main-navbar')--}}
{{--</nav>--}}

<div uk-height-viewport="offset-top: true; offset-bottom: true" class="uk-flex uk-flex-middle">
    @yield('main')
</div>

<!-- Terms model-->
<div id="modal-overflow" uk-modal>
    <div class="uk-modal-dialog">
        <div class="uk-modal-header">
            <b class="uk-text-medium"> قوانین  </b>
        </div>
        <div class="uk-modal-body" uk-overflow-auto>
            {!! register_rules() !!}
        </div>
        <div class="uk-modal-footer uk-text-right">
            <button class="uk-button uk-button-default uk-modal-close" type="button">بستن پنجره</button>
        </div>
    </div>
</div>
<script>
    // Listen for clicks in the document
    document.addEventListener('click', function (event) {

        // Check if a password selector was clicked
        var selector = event.target.getAttribute('data-show-pw');
        if (!selector) return;

        // Get the passwords
        var passwords = document.querySelectorAll(selector);

        // Toggle visibility
        Array.from(passwords).forEach(function (password) {
            if (event.target.checked === true) {
                password.type = 'text';
            } else {
                password.type = 'password';
            }
        });
    }, false);
</script>
</body>
</html>
