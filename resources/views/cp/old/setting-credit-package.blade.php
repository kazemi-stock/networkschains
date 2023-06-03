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
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12 slider-create-wrapper" style="text-align:right ; direction:rtl">
                        <div class="row">
                            <div class="col-md-12 pull-right" >

                                <div class="uploader-wrapper rtl package-input-uploader" data-id="image">
                                    <div class="preview">
                                    </div>
                                    <div class="uploader " >
                                        @include('include.upload-btn' , ['ucls'=>'btn btn-dark' , 'uroute'=>route('profile.upload.image')])
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 pull-right" >
                                <label  class="filter-label">عنوان </label>
                                <input type="text"  data-id="title" class="form-control package-input" >
                            </div>
                            <div class="col-md-6 pull-right" >
                                <label  class="filter-label">مبلغ </label>
                                <input type="text"  data-id="price" class="form-control  package-input" >
                            </div>
                        </div>

                        <hr />

                        {!! button( ['attr'=> [ 'class' => 'btn btn-success store-btn'  , 'data-selector'=>'.package-input' ,  'data-route'=> route('cp.setting.credit.store') ],'text'=>'ثبت پکیج ' ]) !!}




                    </div>

                </div>
            </div>

        </div>

        <div class="card">


                <div class="card-body">


                    @if( !$packages->isEmpty()  )


                        <table class="table table-borderless  table-striped " >
                            <thead>
                            <tr>
                                <th> تصویر  </th>
                                <th> تیتر  </th>
                                <th>توضیحات </th>
                                <th> ویرایش </th>
                                <th> حذف </th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($packages as $package )
                                <tr class="item-row">
                                    <td>
                                        <img src="{{upload_url($package->image)}}" style="max-width: 200px ; max-height: 200px">

                                        <div class="row mt-3 edit-row" style="display: none">
                                            <div class="col-md-12 slider-create-wrapper" style="text-align:right ; direction:rtl">
                                                <div class="row">
                                                    <div class="col-md-12 pull-right" >

                                                        <div class="uploader-wrapper rtl package-input-{{$package->id}}-uploader" data-id="image">
                                                            <div class="preview">
                                                                @include('include.upload-image' ,['file_name' => $package->Upload->file_name ,'token'=>$package->Upload->token , 'original_name'=>$package->Upload->original_name ])
                                                            </div>
                                                            <div class="uploader " style="display: none" >
                                                                @include('include.upload-btn' , ['ucls'=>'btn btn-dark' , 'uroute'=>route('profile.upload.image')])
                                                            </div>
                                                        </div>


                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 pull-right" >
                                                        <label  class="filter-label">قیمت  </label>
                                                        <input type="text"  data-id="price" class="form-control package-input-{{$package->id}}" value="{{$package->price}}" >
                                                    </div>
                                                    <div class="col-md-12 pull-right" >
                                                        <label  class="filter-label">عنوان </label>
                                                        <input type="text"  data-id="title" class="form-control  package-input-{{$package->id}}" value="{{$package->title}}">
                                                    </div>
                                                    <div class="col-md-12 pull-right mt-2" >
                                                        {!! button( ['attr'=> [ 'class' => 'btn btn-success store-btn'  , 'data-selector'=>'.package-input-' . $package->id  ,  'data-route'=> route('cp.setting.credit.store' ,['id'=>$package->id]) ],'text'=>'ویرایش پکیج ' ]) !!}
                                                    </div>
                                                </div>


                                            </div>

                                        </div>



                                    </td>
                                    <td> {{$package->title}} </td>
                                    <td>{{$package->price}} </td>
                                    <td> <a class="btn btn-dark "  onclick="$(this).parents('tr:first').find('.edit-row').toggle()">ویرایش</a>  </td>
                                    <td> <a class="btn btn-danger destroy-item-btn" data-id="{{$package->id}}" data-route="{{route('cp.setting.credit.delete' ,['id'=>$package->id])}}">حذف</a>  </td>

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






@endsection
