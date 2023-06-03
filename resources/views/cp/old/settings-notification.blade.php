@extends('cp.master')


@section('main')
    <style>
        .col-form-label { color: #3a3e42 ; font-weight: bold }


        .odd-row > .row:nth-child(odd){
            background-color: #f5f5f5;
        }
        .form-group {
            margin-bottom: 0px;
            padding: 5px ;
        }

    </style>
    <div class="container-fluid">

        <div class="card not-card" data-id="login" >
            <div class="card-header">لاگین کردن به سامانه</div>
            <div class="card-body">
                <div class="row">

                    <div class="col-md-3">
                        <div>sms</div>
                        <input type="checkbox" class=" not-type check-sms" {{$settings->login->sms == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>ایمیل</div>
                        <input type="checkbox" class=" not-type check-email" {{$settings->login->email == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>نوتیفیکیشن</div>
                        <input type="checkbox" class=" not-type check-notification" {{$settings->login->notification == 1 ? 'checked' : ''}}>
                    </div>

                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <div>عنوان</div>
                        <input type="text" class="form-control not-title" value="{{$settings->login->title}}">
                    </div>
                    <div class="col-md-12">
                        <div>متن</div>
                        <input type="text" class="form-control not-text" value="{{$settings->login->text}}">
                    </div>
                </div>
            </div>
        </div>
        <div class="card not-card" data-id="buy" >
            <div class="card-header">خرید دوره</div>
            <div class="card-body">
                <div class="row">

                    <div class="col-md-3">
                        <div>sms</div>
                        <input type="checkbox" class=" not-type check-sms" {{$settings->buy->sms == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>ایمیل</div>
                        <input type="checkbox" class=" not-type check-email" {{$settings->buy->email == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>نوتیفیکیشن</div>
                        <input type="checkbox" class=" not-type check-notification" {{$settings->buy->notification == 1 ? 'checked' : ''}}>
                    </div>

                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <div>عنوان</div>
                        <input type="text" class="form-control not-title" value="{{$settings->buy->title}}">
                    </div>
                    <div class="col-md-12">
                        <div>متن</div>
                        <input type="text" class="form-control not-text" value="{{$settings->buy->text}}">
                    </div>
                </div>
            </div>
        </div>
        <div class="card not-card" data-id="graduate" >
            <div class="card-header">پاس کردن دوره </div>
            <div class="card-body">
                <div class="row">

                    <div class="col-md-3">
                        <div>sms</div>
                        <input type="checkbox" class=" not-type check-sms" {{$settings->graduate->sms == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>ایمیل</div>
                        <input type="checkbox" class=" not-type check-email" {{$settings->graduate->email == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>نوتیفیکیشن</div>
                        <input type="checkbox" class=" not-type check-notification" {{$settings->graduate->notification == 1 ? 'checked' : ''}}>
                    </div>

                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <div>عنوان</div>
                        <input type="text" class="form-control not-title" value="{{$settings->graduate->title}}">
                    </div>
                    <div class="col-md-12">
                        <div>متن</div>
                        <input type="text" class="form-control not-text" value="{{$settings->graduate->text}}">
                    </div>
                </div>
            </div>
        </div>
        <div class="card not-card" data-id="certificate" >
            <div class="card-header">دریافت لینک گواهینامه یک دوره
            </div>
            <div class="card-body">
                <div class="row">

                    <div class="col-md-3">
                        <div>sms</div>
                        <input type="checkbox" class=" not-type check-sms" {{$settings->certificate->sms == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>ایمیل</div>
                        <input type="checkbox" class=" not-type check-email" {{$settings->certificate->email == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>نوتیفیکیشن</div>
                        <input type="checkbox" class=" not-type check-notification" {{$settings->certificate->notification == 1 ? 'checked' : ''}}>
                    </div>

                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <div>عنوان</div>
                        <input type="text" class="form-control not-title" value="{{$settings->certificate->title}}">
                    </div>
                    <div class="col-md-12">
                        <div>متن</div>
                        <input type="text" class="form-control not-text" value="{{$settings->certificate->text}}">
                    </div>
                </div>
            </div>
        </div>
        <div class="card not-card" data-id="upprofile" >
            <div class="card-header">تغییر پروفایل

            </div>
            <div class="card-body">
                <div class="row">

                    <div class="col-md-3">
                        <div>sms</div>
                        <input type="checkbox" class=" not-type check-sms" {{$settings->upprofile->sms == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>ایمیل</div>
                        <input type="checkbox" class=" not-type check-email" {{$settings->upprofile->email == 1 ? 'checked' : ''}}>
                    </div>

                    <div class="col-md-3">
                        <div>نوتیفیکیشن</div>
                        <input type="checkbox" class=" not-type check-notification" {{$settings->upprofile->notification == 1 ? 'checked' : ''}}>
                    </div>

                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <div>عنوان</div>
                        <input type="text" class="form-control not-title" value="{{$settings->upprofile->title}}">
                    </div>
                    <div class="col-md-12">
                        <div>متن</div>
                        <input type="text" class="form-control not-text" value="{{$settings->upprofile->text}}">
                    </div>
                </div>
            </div>
        </div>



        <hr />

        <div style="padding: 20px">
            <a class="btn btn-dark btn-lg" id="setting-update-btn" data-route="{{route('cp_setting_notification_update')}}">
                <span class="nospiner">به روز رسانی</span>
                <div class="spinner-border   spiner" role="status" >
                    <span class="sr-only"></span>
                </div>
            </a>

        </div>



    </div>



    <script>
        $(document).on('click' , '#setting-update-btn' , function () {
            var data  = [] ;
            $('.not-card').each(function() {
                var obj = {
                    'key' : $(this).data('id') ,
                    'title' : $(this).find('.not-title').val() ,
                    'text' : $(this).find('.not-text').val() ,
                    sms : $(this).find('.check-sms').is(':checked') ? 1 : 0 ,
                    email : $(this).find('.check-email').is(':checked') ? 1 : 0 ,
                    notification : $(this).find('.check-notification').is(':checked') ? 1 : 0 ,

                };

                data.push(obj);
            });

            var btn = $(this);
            loadspiner(btn);

            $.post( btn.data('route') ,csrf( { data:data} ) , function(data){
                unloadspiner(btn);
                data = $.parseJSON(data);
                if(data.stat == 'ok')
                    ok('با موفقیت انجام شد');
                else
                    er(data.msg);
            })

        })


    </script>
@endsection