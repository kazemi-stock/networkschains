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


        <div class="bd-example tab-wrapper ">
            <div class="nav-wrapper">
                <nav>
                    <div class="nav nav-pills nav-justified " id="nav-tab" role="tablist">
                        <a class=" nav-link active show"   data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-contact" aria-selected="true">   تنظیمات کلی<i class="mdi  mdi-message-text"></i></a>
                        <a class=" nav-link "   data-toggle="tab" href="#nav-email" role="tab" aria-controls="nav-email" aria-selected="true">   تنظیمات ایمیل<i class="mdi  mdi-message-text"></i></a>
                        <a class=" nav-link "   data-toggle="tab" href="#nav-sms" role="tab" aria-controls="nav-email" aria-selected="true">   تنظیمات پیامک<i class="mdi  mdi-message-text"></i></a>
                        <a class=" nav-link "   data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="true">    تماس با ما<i class="mdi  mdi-message-text"></i></a>
                        <a class=" nav-link "   data-toggle="tab" href="#nav-text" role="tab" aria-controls="nav-text" aria-selected="true">    متن ها <i class="mdi  mdi-message-text"></i></a>
                        <a class=" nav-link "   data-toggle="tab" href="#nav-stock" role="tab" aria-controls="nav-text" aria-selected="true">    تنظیمات مالی / خرید / امتیاز  <i class="mdi  mdi-message-text"></i></a>
                    </div>
                </nav>

            </div>
            <div class="tab-content" id="settings-tab-wrapper">



                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact">
                    @include('cp.include.setting-contact')
                </div>
                <div class="tab-pane fade" id="nav-email" role="tabpanel" aria-labelledby="nav-email">
                    @include('cp.include.setting-email')
                </div>

                <div class="tab-pane fade" id="nav-sms" role="tabpanel" aria-labelledby="nav-sms">
                    @include('cp.include.setting-sms')
                </div>


                <div class="tab-pane fade" id="nav-text" role="tabpanel" aria-labelledby="nav-text">
                    @include('cp.include.setting-text')
                </div>

                <div class="tab-pane fade" id="nav-stock" role="tabpanel" aria-labelledby="nav-text">
                    @include('cp.include.setting-stock')
                </div>




                <div class="tab-pane fade active show" id="nav-home" role="tabpanel" aria-labelledby="nav-home">

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label " >عنوان سایت</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control"  data-id="siteTitle" value="{{$settings->siteTitle}}">
                            </div>
                        </div>
                    </div>

                    <hr />
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label " >کلمات کلیدی</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control"  data-id="siteKeyword" value="{{$settings->siteKeyword}}">
                            </div>
                        </div>
                    </div>


                    <hr />
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label " >دسکریپشن</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control"  data-id="siteDescrbtion" value="{{$settings->siteDescrbtion}}">
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label " >توضیحات فوتر</label>
                            <div class="col-sm-12">
                                <textarea class="form-control"  data-id="footerText" >{{$settings->footerText}}</textarea>
                            </div>
                        </div>
                    </div>


                    <hr />
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label " >غیر فعال کردن سایت</label>
                            <div class="col-sm-12">
                               <span class="btn btn-danger">
                               خیر <input type="radio" class="form-control general" value="0" name="siteDisable" {{$settings->siteDisable == 0 ? 'checked' : ''}}>
                               </span>
                                <span class="btn btn-success">
                               بله <input type="radio" class="form-control general"  value="1" name="siteDisable" {{$settings->siteDisable == 1 ? 'checked' : ''}}>
                               </span>
                            </div>
                        </div>
                        <div class="form-group col-md-8">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label " >پیام نمایشی هنگام غیرفعال بودن</label>
                            <div class="col-sm-12">

                                <textarea class="form-control"  data-id="siteDisableMsg" >{{$settings->siteDisableMsg}}</textarea>
                            </div>
                        </div>
                    </div>



                </div>

                <hr />
                <div style="padding: 20px">
                    <a class="btn btn-dark btn-lg" id="setting-update-btn" data-route="{{route('cp_setting_update')}}">
                        <span class="nospiner">به روز رسانی</span>
                        <div class="spinner-border   spiner" role="status" >
                            <span class="sr-only"></span>
                        </div>
                    </a>

                </div>
            </div>


        </div>


    </div>



    <script>
    $(document).on('click' , '#setting-update-btn' , function () {
        var arr = new Array() ;
        $('#settings-tab-wrapper').find('.form-control').not('#slider-link').each(function(index, element) {
            var obj = {};
            obj.key = $(this).data('id') ;
            obj.val = $(this).hasClass('numeric') ? number($(this).val()) : $(this).val();
            arr.push(obj);
        });

        $('#settings-tab-wrapper').find('input[type=radio].form-control:checked').each(function(index, element) {
            var obj = {};
            obj.key = $(this).attr('name') ;
            obj.val = $(this).val();
            arr.push(obj);
        });
        var btn = $(this);
        loadspiner(btn);

        $.post( btn.data('route') , { arr:arr , _token:$('input[name=_token]').val()} , function(data){
            unloadspiner(btn);
            data = $.parseJSON(data);
            if(data.stat == 'ok')
                ok('با موفقیت انجامشد');
            else
                er(data.msg);
        })

    })


</script>
@endsection
