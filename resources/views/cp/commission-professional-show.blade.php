@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                @if($com_general->Init->Confirm)
                    <div class="row">
                        <div class="col-md-12" style="text-align:right ; direction:rtl">
                            <div class="alert alert-success">
                                تایید شده در تاریخ
                                <span>{{jdate($com_general->Init->Confirm->created_at)}}</span>
                                توسط
                                <span>{{($com_general->Init->Confirm->Admin->name)}}</span>
                            </div>

                        </div>
                    </div>
                @endif

                @foreach($leftovers as $leftover)
                    <div class="row">
                        <div class="col-md-12" style="text-align:right ; direction:rtl">
                            <div class="alert alert-danger">
                                مبلغ
                                <span>{{$leftover->amount}}</span>
                                امتیاز بدون استفاده در استخر
                                <span>{{($leftover->Pool->level)}}</span>
                                {{$leftover->type =='add' ? 'اضافه ' : 'مصرف '}} شد
                            </div>

                        </div>
                    </div>

                @endforeach

                <div class="row">
                    <div class="col-md-12" style="text-align:right ; direction:rtl">
                        جمع امتیازات
                        <a class="btn btn-success">  {{$com_general->Init->amount}}</a>
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
                                            <label for="fname" class="col-sm-12 text-right control-label col-form-label yekan" >نتیجه</label>
                                            <div class="col-sm-12">
                                                <span class="badge badge-dark">{{$com_general->pool_4}}%</span>

                                                <span class="badge badge-orange">امتیاز صندوق:{{$logs->{4}->total_points}} </span>
                                                <span class="badge badge-orange">امتیاز کاربران:{{$logs->{4}->user_points}} </span>

                                                @if( $logs->{4}->left_over_point> 0)
                                                    <span class="badge badge-danger"> {{( $logs->{4}->left_over_point)}} امتیاز اضافه </span>
                                                @endif
                                                <span class="badge badge-orange">امتیاز بیس:{{$logs->{4}->base_point}} </span>

                                                <span class="badge badge-info"> {{($logs->{4}->total_users)}} کاربر </span>
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
                                            @foreach($logs->{4}->users as $user_comission )
                                                <tr>
                                                    <td> <a href="{{route('cp_user_show' , ['id'=>$user_comission->user->user_id])}}">  {{$user_comission->user->user->name  }}</a></td>
                                                    <td>{{ $user_comission->total_point }}</td>
                                                    <td>{{$user_comission->commission}}</td>
                                                    <td>{{$user_comission->limit  }}</td>
                                                </tr>
                                            @endforeach

                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>



                </div>



            </div>
        </div>


    </div>


@endsection
