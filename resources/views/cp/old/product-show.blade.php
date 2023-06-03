@extends('cp.master')


@section('main')
    <style>
        .col-form-label { color: #da542e}


        .odd-row > .row:nth-child(odd){
            background-color: #f5f5f5;
        }
        .form-group {
            margin-bottom: 0px;
            padding: 5px ;
        }
        .dropdown-menu { text-align: right ; color: black}

    </style>


    <div class="container-fluid">


        <div class="bd-example tab-wrapper ">
            <div class="nav-wrapper">
                <nav>
                    <div class="nav nav-pills nav-justified " id="nav-tab" role="tablist">
                        <a class=" nav-link active show"   data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-contact" aria-selected="true">  مشخصات کلی<i class="mdi  mdi-message-text"></i></a>
                        <a class=" nav-link "   data-toggle="tab" href="#nav-orders" role="tab" aria-controls="nav-profile" aria-selected="false"> خرید ها <i class="mdi mdi-check-all"></i> </a>

                        {{--                        <div class="dropdown float-right">--}}
                        {{--                            <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--}}
                        {{--                                لینک ها--}}
                        {{--                            </button>--}}
                        {{--                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">--}}
                        {{--                                <a class="dropdown-item" href="{{route('cp_ticket_index' ,['uid'=>$user->id])}}"> تیکت ها </a>--}}
                        {{--                                <a class="dropdown-item" href="{{route('cp_course_index' ,['uid'=>$user->id])}}"> دوره ها </a>--}}
                        {{--                                <a class="dropdown-item" href="{{route('cp_transaction_index',['uid'=>$user->id])}}"> تراکنش ها </a>--}}
                        {{--                                <a class="dropdown-item" href="{{route('cp_withdraw_index',['uid'=>$user->id])}}"> درخواست برداشت</a>--}}
                        {{--                            </div>--}}
                        {{--                        </div>--}}

                    </div>
                </nav>

            </div>
            <div class="tab-content bg-same" id="nav-tabContent">


                <div class="tab-pane fade" id="nav-orders" role="tabpanel" aria-labelledby="nav-permission">

                    <div class="card dark-card">
                        <div class="card-header">خرید ها</div>
                        <div class="card-body">
                            {!! empty_query() !!}
                        </div>
                    </div>
                </div>






                <div class="tab-pane fade active show" id="nav-home" role="tabpanel" aria-labelledby="nav-home">


                    <div class="row">
                        <div class="col-md-8 col-12">

                            <div class="card dark-card ">
                                <div class="card-header">
                                    <i class="mdi mdi-view-list ml-2"></i>
                                    مشخصات
                                    <a class="btn btn-success float-left" href="{{route('product.edit' , ['id'=>$product->id])}}">ویرایش</a>
                                </div>
                                <div class="card-body "  >

                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label " >عنوان</label>
                                        <div class="col-sm-9">
                                            {{$product->title}}
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label " >قیمت</label>
                                        <div class="col-sm-9">
                                            {{price($product->price)}}
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label " >امتیاز</label>
                                        <div class="col-sm-9">
                                            {{($product->points)}}
                                        </div>
                                    </div>




                                </div>
                            </div>
                            <div class="card dark-card ">
                                <div class="border-bottom">
                                    <i class="mdi mdi-history ml-2"></i>
                                    آخرین تغییرات
                                </div>
                                <div class="card-body odd-row" style="padding: 5px 0px " >

                                    <table class="table table-striped">
                                        <tr>
                                            <th>تاریخ</th>
                                            <th>کاربر</th>
                                            <th>توضیحات</th>
                                            <th></th>
                                        </tr>
                                        @foreach($product->History as $history )
                                            <tr>
                                                <td>{{jdate($history->created_at)}}</td>
                                                <td>{{$history->User->Alias()}}</td>
                                                <td>{{$history->title}}</td>
                                                <td><a class="btn btn-primary" href="{{route('product.revision' ,['id' => $history->id ])}}">بازگردانی</a> </td>
                                            </tr>

                                        @endforeach
                                    </table>


                                </div>
                            </div>



                        </div>
                        <div class="col-12 col-md-4">


                            <div class="card dark-card">
                                <div class="border-bottom"> تصویر</div>
                                <div class="card-body"  >
                                    <img src="{{upload_url($product->image)}}" style="width: 100%">

                                </div>
                            </div>

                        </div>

                    </div>


                </div>


            </div>
        </div>


    </div>



@endsection
