@component('mail::layout')

    @slot('header')
        @component('mail::header', ['url' => config('app.url')])
            <img src="{{asset_url("img/logo_alt.png")}}" style="display:inline" height="50" >
        @endcomponent
    @endslot


    <div style="text-align: left  ; direction: rtl">

        <h2>Welcome to the Networks Chains </h2>
        <br />
        <br />
        <h3>Dear {{$user->name}}</h3>
        <br />
        <h3>Thank you for signing up with us.
            Your new account has been setup and you can now login to our client area using the details below.</h3>
        <br />
        <h3>your code: </h3>
        <strong style="margin: 0px 5px; font-size: 18px">{{$user->token}}</strong>


        @component('mail::button', ['url' =>  route('verfy.email' , ['token'=>md5($user->token) ,'id'=>$user->id ]) ])
            activate my account
        @endcomponent

    </div>

    {{-- Footer --}}
    @slot('footer')
        @component('mail::footer')
            copyrights
        @endcomponent
    @endslot
@endcomponent
