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
        #nav-profile label {


            color: #226ad6;
            font-size: 15px;

        }
        #nav-profile .col-md-4 { padding: 10px    }

    </style>
    <div class="container-fluid">


        <div class="bd-example tab-wrapper ">
            <div class="nav-wrapper">
                {!! button( ['attr'=> [ 'class' => 'btn btn-success store-btn' ,'data-callback'=>'remove'  , 'data-selector'=>'.response-input' ,  'data-route'=> route('cp.user.unconfirmed.confirm.store' ,['id'=>$user->id]) ],'text'=>'تایید اکانت کاربر ' ]) !!}

            </div>
            <div class="tab-content bg-same" id="nav-tabContent">





                <div class="tab-pane fade active show" id="nav-home" role="tabpanel" aria-labelledby="nav-home">


                    <div class="row">
                        <div class="col-md-12 col-12">

                            <div class="card dark-card ">
                                <div class="card-header">



                                </div>
                                <div class="card-body " id="user-info"   >

                                    <div class="row">
                                        <div class="col-6">

                                            <div class="form-group row">
                                                <label for="fname" class="col-sm-3 text-right control-label col-form-label " >نام</label>
                                                <div class="col-sm-9">
                                                    {{$user->name}}
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="fname" class="col-sm-3 text-right control-label col-form-label " >ایمیل</label>
                                                <div class="col-sm-9">
                                                    {{$user->email}}
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="fname" class="col-sm-3 text-right control-label col-form-label " >کد عضویت</label>
                                                <div class="col-sm-9">
                                                    {{$user->token}}
                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-6">

                                            <div class="form-group row">
                                                <label for="fname" class="col-sm-3 text-right control-label col-form-label " >موجودی اعتبار</label>
                                                <div class="col-sm-9">
                                                    {{price($user->credit)}}
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="fname" class="col-sm-3 text-right control-label col-form-label " >موجودی امتیاز</label>
                                                <div class="col-sm-9">
                                                    {{($user->point)}}
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="fname" class="col-sm-3 text-right control-label col-form-label " >کل امتیازات کسب شده</label>
                                                <div class="col-sm-9">
                                                    {{($user->total_point)}}
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="fname" class="col-sm-3 text-right control-label col-form-label " >تعداد سهام</label>
                                                <div class="col-sm-9">
                                                    {{($user->stock)}}
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-12 col-md-12">

                            <div class="card dark-card">
                                <div class="border-bottom">  پرداخت ها </div>
                                <div class="card-body"  >

                                    @if( !$payments->isEmpty()  )
                                        <table class="table table-borderless  table-striped ">
                                            <thead>
                                            <tr>
                                                <th> شناسه  </th>
                                                <th> کاربر  </th>
                                                <th> تگ  </th>
                                                <th> مبلغ </th>
                                                <th> تاریخ ارسال </th>
                                                <th> وضعیت </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($payments as $payment )
                                                <tr  class="item-row">
                                                    <td> {{$payment->id}} </td>
                                                    <td>  <a href="{{route('cp_user_show' , ['id'=>$payment->User->id])}}"> {{$payment->User->Alias()}} </a>  </td>
                                                    <td> {{$payment->tag}} </td>
                                                    <td> {{$payment->amount}} </td>

                                                    <td> {{jdate($payment->created_at)}} </td>
                                                    <td>
                                                        @if($payment->Response  )
                                                            @if($payment->Response->status == 'accept')

                                                                <div class="alert alert-success">
                                                                    <ul>
                                                                        <li> تایید شد</li>
                                                                        <li> تاریخ : {{jdate($payment->Response->created_at)}} </li>
                                                                        <li> مدیر : {{($payment->Response->Admin->name)}} </li>
                                                                        <li> توضیحات : {{($payment->Response->text)}} </li>
                                                                    </ul>
                                                                </div>
                                                            @elseif($payment->Response->status == 'deny')
                                                                <div class="alert alert-danger">
                                                                    <ul>
                                                                        <li> رد شد</li>
                                                                        <li> تاریخ : {{jdate($payment->Response->created_at)}} </li>
                                                                        <li> مدیر : {{($payment->Response->Admin->name)}} </li>
                                                                        <li> توضیحات : {{($payment->Response->text)}} </li>
                                                                    </ul>
                                                                </div>

                                                            @endif

                                                        @else
                                                            <a class="btn btn-info" href="{{route('cp.crypto.response.create' ,['id'=>$payment->id ])}}"> ثبت پاسخ </a>
                                                        @endif
                                                    </td>

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

                    </div>


                </div>


            </div>
        </div>


    </div>



@endsection
