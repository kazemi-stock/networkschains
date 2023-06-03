@extends('cp.master')

@section('header')
    <script src="{{asset_url('js/upd.js')}}"></script>
@endsection


@section('main')


<style>
    #category-ul li { padding: 5px  20px ; list-style: none ; font-weight: bold }
    #category-ul > ul > li { background: #f5f5f5 ; margin-bottom: 2px  }
    #category-ul ul { padding:0px ; margin: 0px  }
    #category-ul ul.child   { background: white ;  border-top: dashed  1px #cecece ; margin-top: 10px ; display: none  }
</style>

    <script>
       $(document).on('change' , '.ccheck' , function(){
           if(this.checked)
                $(this).parents('li:first').find('ul:first').show();
           else
               $(this).parents('li:first').find('ul').hide();

       })



        $(document).ready(function(){
            $('.ccheck').each(function(){
                if(this.checked)
                {
                    $(this).parents('ul:first').show();
                    $(this).parents('li:first').find('ul:first').show();
                }
            })

        })
    </script>
<div class="container-fluid">
@if($draft)
    <div class="alert alert-warning">شما در حال مشاهده نسخه پیش نویس میباشد
    <hr />
    <a class="btn btn-danger" href="{{route('blog_draft_delete_cp' ,['id'=>$draft->id])}}">حذف پیش نویش</a>
    </div>
@endif

<div class="card card-default" id="news-form">
        <div class="card-header">
            @if($edit)
                {{route('blog_show' ,['url'=>$edit->url , 'slug'=>$edit->slug ])}}
            @else
                فرم ثبت مقاله
            @endif
        </div>
        <div class="card-body card-default">
            <div class="form-body pal">
                     <div class="row" >
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label>عنوان </label>
                                    <input type="text" class="form-control"  data-id="title" value="{{$edit ? $edit->title : '' }}">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label>عنوان صفحه </label>
                                    <input type="text" class="form-control"  data-id="page_title" value="{{$edit ? $edit->page_title : '' }}">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label> لینک  </label>
                                    <input type="text" class="form-control"  data-id="slug" value="{{$edit ? $edit->slug : '' }}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label> مقاله برتر  </label>
                                    {!! select([0 => 'خیر' , 1 => 'بله' ] , ['data-id'=>'suggested'] , $edit ? $edit->suggested : 0 , 0 ) !!}
                                </div>
                            </div>
                        </div>
                          <div class="col-md-12">
                             <div class="form-group">
                                 <div class="input-icon description-wrapper" style="position: relative">
                                     <label> دسکریپشن  </label>
                                     <textarea  class="form-control description-controller"  data-id="description">{{$edit ? $edit->description : '' }}</textarea>
                                     <span  class="description-counter"></span>
                                 </div>
                             </div>
                         </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label> کلمات کلیدید (با کاما جدا کنید )  </label>
                                    <input type="text" class="form-control"  data-id="keywords" value="{{$edit ? $edit->keywords : '' }}">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label> توضیح کوتاه  </label>
                                    <textarea class="form-control" data-id="jest">{{$edit ? $edit->jest : '' }}</textarea>
                                </div>
                            </div>
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



                <div class="row" >
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label dir="rtl"> توضیحات </label>
                                    <textarea  class="form-control"  name="text" id="text">@if($draft){{$draft->text}}@elseif($edit){{$edit->text}}@endif</textarea>
                                </div>
                            </div>
                        </div>



                    </div>
                    <hr />

                    <div class="card ">
                        <div class="card-header">
                            تصویر اصلی
                            <br style="clear:both;">
                        </div>
                        <div class="card-body">
                            <div class="form-body pal">

                                <div class="row">
                                    <div class="col-md-12" style="padding: 0px;">


                                            <div class="uploader-wrapper rtl" id="blog-image">
                                                <div class="preview">
                                                    @if($edit)
                                                    @include('include.upload-image' ,['token'=>$edit->ImageUpload->token , 'file_name'=>$edit->ImageUpload->file_name, 'original_name'=>$edit->ImageUpload->original_name])
                                                    @endif
                                                </div>
                                                <div class="uploader hidden" style="{{$edit ? 'display:none' : ''}}">
                                                    @include('include.upload-btn' , ['ucls'=>'btn btn-dark' , 'uroute'=>route('cp_upload_image')])

                                                </div>
                                            </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr />

                    <div class="card ">
                        <div class="card-header">
                            تصویر هدر
                            <br style="clear:both;">
                        </div>
                        <div class="card-body">
                            <div class="form-body pal">

                                <div class="row">
                                    <div class="col-md-12" style="padding: 0px;">


                                            <div class="uploader-wrapper rtl" id="blog-banner">
                                                <div class="preview">
                                                    @if($edit && $edit->BannerUpload)
                                                    @include('include.upload-image' ,['token'=>$edit->BannerUpload->token , 'file_name'=>$edit->BannerUpload->file_name, 'original_name'=>$edit->BannerUpload->original_name])
                                                    @endif
                                                </div>
                                                <div class="uploader hidden" style="{{$edit  && $edit->BannerUpload? 'display:none' : ''}}">
                                                    @include('include.upload-btn' , ['ucls'=>'btn btn-dark' , 'uroute'=>route('cp_upload_image')])

                                                </div>
                                            </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                    <div class="row" style="padding:15px">
                        {!! csrf_field() !!}

                        <div class="col-md-4 pull-left">
                            <button type="submit" class="btn btn-secondary" id="save-form-btn" onclick="save_news()">
                                <span class="nospiner"> {{$edit ? 'ویرایش' : 'ثبت' }} مقاله </span>
                                <div class="spinner-border   spiner" role="status" >
                                    <span class="sr-only"></span>
                                </div>
                            </button>

                        </div>
                        <div class="col-md-4 pull-left">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label dir="rtl"  style="text-align: left" >  ثانیه : دقیقه : ساعت </label>
                                    <input type="text" class="time form-control" style="text-align: left ; direction: ltr" data-id="publish_time" value="{{$edit && $edit->publish_date ? jdate($edit->publish_date , 'H:i:s') : ''}}">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 pull-left">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label dir="rtl"> تاریخ انتشار </label>
                                    <input type="text" class="date form-control" data-id="publish_date" value="{{$edit && $edit->publish_date ? jdate($edit->publish_date , 'Y-m-d') : ''}}">

                                </div>
                            </div>
                        </div>



                    </div>


            </div>
        </div>
    </div>

</div>





    {!! ck_js() !!}
    {!! ck('text') !!}


    <script>

        $(document).on('click' ,'#add-image-btn' , function () {

            $('#editor-uploader').append(`

                                  <div class="uploader-wrapper rtl" id="blog-image">
                                    <div class="preview">
                                    </div>
                                    <div class="uploader hidden" >
                                        <div class="upload-btn-wrapper">
                                            <button class="btn btn-primary  yekan fs13">
                                                آپلود عکس
                                                <i class="mdi mdi-arrow-up uk-margin-small-left"></i>
                                            </button>
                                            <input type="file" name="file" class="standard-upload-files" data-route="${$(this).data('route')}" >
                                        </div>

                                    </div>
                                </div>

            `)

        })

       var inteval = false ;
        CKEDITOR.instances.text.on('key', function(e) {
            var self = this;

            if(!inteval && self.getData().length > 10 )
            inteval =  setInterval( function(){draft()} , 5000 );

        });

        function draft(){

            var text = CKEDITOR.instances.text.getData() ;

            $.post('{{route('blog_draft_cp' , ['id'=>$edit ? $edit->id : 0])}}' , csrf({text : text })  , function(data){

            })
        }



        function get_data(){
            var obj = { };
            $('#news-form').find('.form-control').each(function () {
                if(typeof  $(this).data('id') != 'undefined')
                    obj[$(this).data('id')] = this.value;
            })

            obj.categories = [] ;
            $('.ccheck').each(function(){
                if(this.checked)
                {
                    obj.categories.push(this.value)
                }
            })

            obj['text'] = CKEDITOR.instances['text'].getData();
            if($('#blog-image').find('.success-upload').length == 1 )
                obj.image = $('#blog-image').find('.success-upload').data('token');
            if($('#blog-banner').find('.success-upload').length == 1 )
                obj.banner = $('#blog-banner').find('.success-upload').data('token');
            return obj;
        }


        var inprog = false;
        function save_news()
        {
            inprog = true ;
            var btn = $('#save-form-btn');
            var obj = get_data() ;
            loadspiner(btn);

            $.post('{{route('blog_save_cp' , ['id'=>$edit ? $edit->id : ''])}}' , csrf(obj)  , function(data){
                unloadspiner(btn);
                data = $.parseJSON(data);
                if(data.stat == 'ok')
                {
                    ok('با موفقیت انجام شد ');
                    document.location = '{{route('blog_index_cp')}}' ;
                }
                else
                {
                    er(data.msg);
                }
            })
        }


    </script>


@endsection
