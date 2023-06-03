@extends('cp.master')

@section('header')
    <script src="{{asset_url('js/upd.js')}}"></script>
@endsection
@section('main')

    <div class="container-fluid">
    <div class="card dark-card">
        <div class="card-header">
            <div class="row">



                <div class="col-md-8 ">
                    <ol class="breadcrumb " style="text-align: right ; background-color: inherit">
                        @foreach(category_line($parent_id) as $k=>$v)
                            <li><a href="{{route('category_index_cp' , ['parent_id'=>$v->parent_id])}}">{{$v->title}}</a></li>

                        @endforeach
                    </ol>
                </div>
                <div class="col-md-4 text-left">
                    ثبت دسته بندی جدید
                </div>

            </div>
        </div>



    <div id="form-make-wrapper" class="card-body">


        <div class="form-body pal">

            <div class="row" >
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="input-icon">
                            <label>عنوان </label>
                            <input type="text" class="form-control category-input"  data-id="title" value="{{$edit ? $edit->title : '' }}">
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="input-icon">
                            <label>عنوان صفحه </label>
                            <input type="text" class="form-control category-input"  data-id="page_title" value="{{$edit ? $edit->page_title : '' }}">
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="input-icon">
                            <label> لینک </label>
                            <input type="text" class="form-control category-input"  data-id="slug" value="{{$edit ? $edit->slug : '' }}">
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="input-icon">
                            <label> تصویر </label>

                            <div class="uploader-wrapper category-input-uploader" data-id="image">
                                <div class="preview">
                                    @if($edit && $edit->Upload)
                                        @include('include.upload-image' , ['file_name'=>$edit->Upload->file_name , 'token'=>$edit->Upload->token , 'original_name'=>$edit->Upload->original_name  ])
                                    @endif
                                </div>
                                <div class="uploader">
                                    @include('include.upload-btn' , ['ucls'=>'btn btn-dark' , 'uroute'=>route('cp_upload_image')])
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <input  type="hidden" class="form-control category-input" data-id="parent_id" value="{{$parent_id}}">


            </div>

        </div>

        <hr />




        <div class="row" style="padding:15px">
       {!! button(['text' =>$edit ? 'ویرایش' : 'ثبت'  . ' دسته بندی ' , 'attr'=>['class'=>'btn btn-info store-btn' ,'data-selector'=>'.category-input'   ,'data-route'=> $edit ? route('category_update' , ['id' => $edit->id ]):route('category_store' ) ] ]) !!}

        </div>



    </div>
    </div>
    </div>
@endsection
