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

                    @for($i=1 ; $i<=5 ; $i++ )

                        @if($i == 4) @continue @endif

                        @php($this_poll = "pool_$i" )

                        <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">درصد استخر {{$i}}</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                            <label for="fname" class="col-sm-12 text-right control-label col-form-label yekan" >نتیجه</label>
                                            <div class="col-sm-12">
                                                <span class="badge badge-dark">{{$com_general->$this_poll}}%</span>


                                                <span class="badge badge-orange">امتیاز صندوق:{{$logs->{$i}->total_points}} </span>
                                                <span class="badge badge-orange">امتیاز کاربران:{{$logs->{$i}->user_points}} </span>

                                                @if( $logs->{$i}->left_over_point> 0)
                                                    <span class="badge badge-danger"> {{( $logs->{$i}->left_over_point)}} امتیاز اضافه </span>
                                                @endif
                                                <span class="badge badge-orange">امتیاز بیس:{{$logs->{$i}->base_point}} </span>

                                                <span class="badge badge-info"> {{($logs->{$i}->total_users)}} کاربر </span>
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
                                                    @foreach($logs->{$i}->users as $user_comission )
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

                    @endfor




                </div>



            </div>
        </div>


    </div>


@endsection
