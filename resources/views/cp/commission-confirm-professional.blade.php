@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                @if($com_pro->Init->Confirm)
                    <div class="row">
                        <div class="col-md-12" style="text-align:right ; direction:rtl">
                            <div class="alert alert-success">
                                تایید شده در تاریخ
                                <span>{{jdate($com_pro->Init->Confirm->created_at)}}</span>
                                توسط
                                <span>{{($com_pro->Init->Confirm->Admin->name)}}</span>
                            </div>

                        </div>
                    </div>
                @endif

                <div class="row">
                    <div class="col-md-12" style="text-align:right ; direction:rtl">
                        جمع امتیازات
                        <a class="btn btn-success">  {{$com_pro->Init->amount}}</a>
                    </div>
                </div>

            </div>
            <div class="card-body">


                <div class="row">

                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">درصد استخر 4</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                            <label for="fname" class="col-sm-12 text-right control-label col-form-label yekan" >درصد</label>
                                            <div class="col-sm-12">
                                                <span class="badge badge-dark">{{$com_pro->pool_4}}%</span>

                                                <span class="badge badge-orange">امتیاز صندوق:{{$user_commissions[4]['total_points']}} امتیاز</span>
                                                <span class="badge badge-orange">امتیاز کاربران:{{$user_commissions[4]['user_points']}} امتیاز</span>
                                                @if( $user_commissions[4]['left_over_point']> 0)
                                                    <span class="badge badge-danger"> {{($user_commissions[4]['left_over_point'])}} امتیاز اضافه </span>
                                                @endif
                                                <span class="badge badge-orange">امتیاز بیس:{{$user_commissions[4]['base_point']}} </span>

                                                <span class="badge badge-info"> {{($user_commissions[4]['total_users'])}} کاربر </span>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>کاربر</th>
                                                <th>امتیاز</th>
                                                <th>کمیسیون</th>
                                                <th>لیمیت</th>
                                            </tr>
                                            @foreach($user_commissions[4]['users'] as $user_comission )
                                                <tr>
                                                    <td> <a href="{{route('cp_user_show' , ['id'=>$user_comission['user']->user_id])}}">  {{$user_comission['user']->User->Alias()  }}</a></td>
                                                    <td>{{$user_comission['total_point']}}</td>
                                                    <td>{{$user_comission['commission']}}</td>
                                                    <td>{{$user_comission['limit']}}</td>
                                                </tr>
                                            @endforeach

                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>




                </div>

                <hr />

                @if(!$com_pro->Init->Confirm)
                    <div class="row">
                        <div class="col-md-12">
                            {!! button( ['attr'=> [ 'class' => 'btn btn-primary store-btn' , 'data-callback'=>'remove' , 'data-selector'=>'.com-input' ,  'data-route'=> route('cp.commission.confirm.professional.store' , ['id'=>$com_pro->id]) ],'text'=>'تایید نهایی ' ]) !!}
                        </div>
                    </div>
                @endif


            </div>
        </div>


    </div>


@endsection
