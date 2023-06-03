@extends('cp.master')

@section('header')
    <script src="{{asset_url('js/upd.js')}}"></script>

    {!! ck_js() !!}
@endsection

@section('main')

    <div class="container-fluid">

        <div class="card dark-card">
            <div class="card-header">
                        ثبت محصول جدید
            </div>
            <div  class="card-body">
                    <div class="row" >

                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label>عنوان </label>
                                    <input type="text" class="form-control product-input"  data-id="title" >
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label> لینک </label>
                                    <input type="text" class="form-control product-input"  data-id="slug" >
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label> قیمت </label>
                                    <input type="text" class="form-control product-input"  data-id="price" >
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label> امتیاز </label>
                                    <input type="text" class="form-control product-input"  data-id="points" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon product-input-editor" data-id="text">
                                    <label> توضحیحات کوتاه </label>
                                    <textarea class="form-control product-input" data-id="jest"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon product-input-editor" data-id="text">
                                    <label> توضیحات </label>
                                    <textarea id="text"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
        </div>

        <div class="card dark-card">
            <div class="card-header">آپلود تصویر</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="input-icon">
                                <div class="uploader-wrapper product-input-uploader" data-id="image">
                                    <div class="preview">
                                    </div>
                                    <div class="uploader">
                                        @include('include.upload-btn' , ['ucls'=>'btn btn-dark' , 'uroute'=>route('cp_upload_image')])
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="card dark-card">
            <div class="card-header">دسته بندی </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12 category-chain-globbal-wrapper product-input-chain" data-id="categories">

                        <div class="form-group category-chain-this-wrapper">
                            <div class="input-icon" data-id="text">
                                <label> دسته  </label>
                                {!! select($categories , ['class'=>'form-control category-chain-input chain-input' , 'data-route'=>route('category.subcategory.cp') ]) !!}
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>



        <hr />
        {!! button(['text' => 'ساخت محصول' , 'attr'=>['class'=>'btn btn-dark store-btn' ,'data-selector'=>'.product-input'   ,'data-route'=>  route('product.store')] ]) !!}

    </div>


    {!! ck('text') !!}


@endsection
