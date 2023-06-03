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
                                <input type="text" class="form-control product-input"  data-id="title"  value="{{$product->title}}">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="input-icon">
                                <label> لینک </label>
                                <input type="text" class="form-control product-input"  data-id="slug" value="{{$product->slug}}" >
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="input-icon">
                                <label> قیمت </label>
                                <input type="text" class="form-control product-input"  data-id="price" value="{{$product->price}}" >
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="input-icon">
                                <label> امتیاز </label>
                                <input type="text" class="form-control product-input"  data-id="points"  value="{{$product->points}}">
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
                                <textarea class="form-control product-input" data-id="jest">{{$product->jest}}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="input-icon product-input-editor" data-id="text">
                                <label> توضحیحات کامل </label>
                                <textarea id="text">{{$product->text}}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">


                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="input-icon">
                                <label> آپلود عکس </label>
                                <div class="uploader-wrapper product-input-uploader" data-id="image">
                                    <div class="preview">
                                        @include('include.upload-image' , ['file_name'=>$upload->file_name , 'token'=>$upload->token , 'original_name'=>$upload->original_name , ])
                                    </div>
                                    <div class="uploader " style="display: none" >
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

                        @foreach($categories as $category)
                        <div class="form-group category-chain-this-wrapper">
                            <div class="input-icon" data-id="text">
                                <label> دسته  </label>
                                {!! select($category->ParentGroup , ['class'=>'form-control category-chain-input chain-input' , 'data-route'=>route('category.subcategory.cp') ] , $category->id) !!}
                            </div>
                        </div>
                        @endforeach

                    </div>
                </div>
            </div>
        </div>


        <hr />
        {!! button(['text' => 'ساخت محصول' , 'attr'=>['class'=>'btn btn-dark store-btn' ,'data-selector'=>'.product-input'   ,'data-route'=>  route('product.update' ,['id'=>$product->id])] ]) !!}

    </div>


    {!! ck('text') !!}


@endsection
