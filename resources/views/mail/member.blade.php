@component('mail::layout')

    @slot('header')
        @component('mail::header', ['url' => config('app.url')])
            <img src="{{asset_url("image/logo-big-dark.png")}}" style="display:inline" height="50" >
        @endcomponent
    @endslot


    <div style="text-align: right ; direction: rtl">

        به سایت تعاونی پاژ خوش آمدید
        <br />
        <br />
        کد شما : {{$user->token}}
        <br />
        <br />
        ثبت نام شما
        با نام کاربری
        <strong style="margin: 0px 5px">{{$user->name}}</strong>
        با موفقیت انجام شد , برای فعال سازی اکانت خود بر روی لینک زیر کلیک کنید

        @component('mail::button', ['url' =>  route('verfy.email' , ['token'=>$user->token ,'id'=>$user->id ]) ])
            فعال سازی اکانت
        @endcomponent

    </div>

    {{-- Footer --}}
    @slot('footer')
        @component('mail::footer')
            کلیه حقوق  و متن کپی رایت
        @endcomponent
    @endslot
@endcomponent
