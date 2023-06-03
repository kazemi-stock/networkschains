@extends('cp.master')

@section('header')
    <script src="{{asset_url('js/upd.js')}}"></script>
@endsection
@section('main')

    <style>
        .slider-create-wrapper .row { margin-bottom: 20px }
    </style>
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12 slider-create-wrapper" style="text-align:right ; direction:rtl">
                            <div class="row">
                                <div class="col-md-12 pull-right" >
                                    <div  class="slider-image">
                                        <div class="uploader-wrapper">
                                            <div class="preview">
                                            </div>
                                            <div class="uploader">
                                                @include('include.upload-btn' , ['ucls'=>'btn btn-primary' , 'uroute'=>route('cp_upload_image')])
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        <div class="row">

                            <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                <a class="btn btn-success slider-setting-save" data-route="{{route('cp_setting_slider_update')}}"  >
                                    <span class="nospiner">  ثبت اسلایدر</span>
                                    <div class="spinner-border   spiner" role="status" >
                                        <span class="sr-only"></span>
                                    </div>
                                </a>
                            </div>


                    </div>




                </div>

            </div>



            <div class="card-body">


                @if( !$sliders->isEmpty()  )


                    <table class="table table-borderless  table-striped " >
                        <thead>
                        <tr>
                            <th> تصویر  </th>
                            <th> ویرایش </th>
                            <th> حذف </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($sliders as $slider )
                        <tr class="item-row">
                         <td>
                            <img src="{{upload_url($slider->image)}}" style="max-width: 200px ; max-height: 200px">

                            <div class="row mt-3 edit-row" style="display: none">
                                <div class="col-md-12 slider-create-wrapper" style="text-align:right ; direction:rtl">
                                    <div class="row">
                                        <div class="col-md-12 pull-right" >
                                            <div  class="slider-image">
                                                <div class="uploader-wrapper">
                                                    <div class="preview">
                                                        @include('include.upload-image' , ['file_name'=>$slider->Upload->file_name , 'token'=>$slider->Upload->token , 'original_name'=>$slider->Upload->original_name , ])
                                                    </div>
                                                    <div class="uploader">
                                                        @include('include.upload-btn' , ['ucls'=>'btn btn-primary' , 'uroute'=>route('cp_upload_image')])
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                            <a class="btn btn-success slider-setting-save" data-route="{{route('cp_setting_slider_update' ,['id'=>$slider->id])}}"  >
                                                <span class="nospiner">  ویرایش اسلایدر</span>
                                                <div class="spinner-border   spiner" role="status" >
                                                    <span class="sr-only"></span>
                                                </div>
                                            </a>
                                        </div>


                                    </div>




                                </div>

                            </div>



                        </td>
                        <td> <a class="btn btn-dark "  onclick="$(this).parents('tr:first').find('.edit-row').toggle()">ویرایش</a>  </td>
                        <td> <a class="btn btn-danger destroy-item-btn" data-id="{{$slider->id}}" data-route="{{route('cp_setting_slider_delete' ,['id'=>$slider->id])}}">حذف</a>  </td>

                        </tr>
                        @endforeach


                        </tbody>
                    </table>

                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>
    <script>



        $(document).on('click' , '.slider-setting-save' , function(){
            let data = {  } ;
            let w = $(this).parents('.slider-create-wrapper:first');
            w.find('.slider-input').each(function () {
                data[$(this).data('id')] = this.value ;
            })

            if(w.find('.slider-image').find('.success-upload').length == 1 )
                data.image = w.find('.slider-image').find('.success-upload').data('token');

            var btn = $(this);

            loadspiner( btn);
            $.post( btn.data('route') , csrf(data) , function(data){
                unloadspiner(btn);
                data = $.parseJSON(data);
                if(data.stat == 'ok')
                {
                    document.location = document.location ;
                }
                else
                    er(data.msg);
            });

        })
    </script>



@endsection
