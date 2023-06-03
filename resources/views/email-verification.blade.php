@extends('master')



@section('main')
    <div class="uk-margin uk-padding-small uk-container-small uk-margin-auto  uk-margin-large-top color-black">

        @if($msg == 'success')
            <div class="uk-alert uk-alert-success uk-text-dark">
                <div class="uk-padding-small">
                    You'r Email Verified... ,
                    Please click the next button to continue your registration process

                </div>

                <hr />
                <a class="uk-button uk-button-secondary" href="{{route('confirm.waiting')}}">NEXT STEP </a>
            </div>
        @elseif($msg == 'duplicate' )
            <div class="uk-alert uk-alert-warning uk-text-dark">
                This email has already been activated
            </div>
        @elseif($msg == 'wtoken' )
            <div class="uk-alert uk-alert-warning uk-text-dark">
                The activation code is incorrect
            </div>
        @elseif($msg == 'require' )
            <div class="uk-alert uk-alert-warning uk-text-dark">
                <div class="uk-padding-small">
                    The activation link was sent to your email, please activate your account by clicking on the link, if you do not receive the link, press the button below to have the link sent to you again.
                </div>

                <hr />

                {!! button( ['attr'=> [ 'class' => 'uk-button uk-button-secondary store-btn'  , 'data-selector'=>'.verify-input' ,  'data-route'=> route('resend.verfy.email') ],'text'=>'Send E-Mail Again ' ]) !!}

            </div>
        @endif
    </div>


@endsection
