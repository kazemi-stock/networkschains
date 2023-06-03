@extends('cp.master')
@section('header')
    {!! ck_js() !!}
@endsection


@section('main')

    <div class="container-fluid">


        <div class="row">

            <div class="col-md-12 col-12 float-right pull-right">
                <div class="card gray-card no-shadow" >

                    <div class="border-bottom">
                        <h4 class="card-title">مشخصات کوین</h4>
                    </div>

                    <div class="card-body">
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" >عنوان</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="page-title" value="">
                            </div>
                        </div>
                        <hr />

                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" > لینک</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="page-slug" value="">
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="uploader-wrapper">
                                    <div class="preview">
                                    </div>
                                    <div class="uploader">
                                        @include('include.upload-btn' , ['ucls'=>'btn btn-primary' ,'utext'=>'آپلود عکس ادیتور' , 'uroute'=>route('cp_upload_image')])
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />


                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" >  متن</label>
                            <div class="col-sm-12">
                                <textarea id="text"></textarea>

                            </div>
                        </div>
                        <hr />




                        <a class="btn btn-success" id="page-make-btn" data-route="{{route('cp_page_store')}}"  >
                            <span class="nospiner">  ثبت پیج جدید</span>
                            <div class="spinner-border   spiner" role="status" >
                                <span class="sr-only"></span>
                            </div>
                        </a>

                    </div>
                </div>
            </div>



        </div>

    </div>
    {!! ck('text') !!}

    <script>


        $(document).on('click' , '#page-make-btn' , function(){
            let data = {

                title : $('#page-title').val() ,
                slug : $('#page-slug').val() ,
                text : CKEDITOR.instances.text.getData(),

            } ;

            var btn = $(this);

            loadspiner( btn);
            $.post( btn.data('route') , csrf(data) , function(data){
                unloadspiner(btn);
                data = $.parseJSON(data);
                if(data.stat == 'ok')
                {
                    ok('با موفقیت انجام شد');
                    document.location = data.url ;
                }
                else
                    er(data.msg);
            });

        })
    </script>


@endsection
