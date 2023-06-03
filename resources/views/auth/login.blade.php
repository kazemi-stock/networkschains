@extends('master')

@section('main')
    <style>
        #sc-header { background-image: url('{{asset("assets/img/bg_1.jpg")}}')}
        body{
            background-image: url('{{asset("assets/img/bg_1.jpg")}}')
        }
        .black-btn {
            background: #37474f;color: #ffffff;
        }
        .black-btn:hover {
            background: #37474f;color: #ffcc6e;
        }
        @media screen and (max-width: 959px){

        }
    </style>
  @include('auth.login-modal')
{{--    <script>--}}
{{--        var logo = parseInt(screen.width)--}}
{{--        if(logo <=959) {--}}
{{--            document.getElementById("logo").src = "{{asset_url('img/logo_log.png')}}"--}}
{{--        }--}}
{{--    </script>--}}
@endsection
