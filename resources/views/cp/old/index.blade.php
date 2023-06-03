@extends('cp.master')



@section('main')
<style>
    .stat-div {
        background-color: #454c52;
        color: #ececec;
        padding: 10px;
        text-align: right;
    }
    .stat-div .title {  font-size: 14px; padding-bottom: 10px ; font-weight: bold }
    .stat-div  i {   font-size: 50px ; color: #7fd2c4; }
    .stat-div .stat { font-weight: bold ; font-size: 25px  ;  direction: rtl}
    .stat-div .col-4 { text-align: center}
    .stat-div .col-8 { padding-bottom: 10px ; padding-top: 10px}
</style>
    <div class="container-fluid" style="margin-top: 20px">
        <div class="row">


            <div class="col-md-4 col-12 mb-2">
                <div class="stat-div">
                    <div class="row">
                        <div class="col-8">
                            <div class="title">کاربران ثبت نامی</div>
                            <div class="stat"> {{$all_stat['users']}}  نفر</div>
                        </div>
                        <div class="col-4 "><i class="mdi mdi-account"></i></div>

                    </div>
                </div>
            </div>

            <div class="col-md-4 col-12 mb-2">

                <div class="stat-div">
                    <div class="row">
                        <div class="col-8">
                            <div class="title">تیکت ها</div>
                            <div class="stat"> {{$all_stat['tickets']}}  عدد</div>
                        </div>
                        <div class="col-4"><i class="mdi mdi-email-open"></i></div>

                    </div>
                </div>

            </div>

            <div class="col-md-4 col-12 mb-2">

                <div class="stat-div">
                    <div class="row">
                        <div class="col-8">
                            <div class="title">درخواست ها</div>
                            <div class="stat"> {{$all_stat['services']}}  عدد</div>
                        </div>
                        <div class="col-4"><i class="mdi mdi-folder"></i></div>

                    </div>
                </div>



            </div>


        </div>


        <hr />

        <div class="row">

            <div class="col-md-4 col-12">
                <div class="card">
                    <div class="card-header">ثبت نام های امروز</div>
                    <div class="card-body">
                            @if($today_data['users']->isEmpty())
                                <div class="alert alert-warning">موردی موجود ندارد</div>
                            @else
                                <table class="table">
                                @foreach($today_data['users'] as $user )
                                    <tr  class="item-row">
                                        <td>  <a href="{{route('cp_user_show' , ['id'=>$user->id])}}">  {{$user->mobile  }}</a>  </td>
                                        <td>  <a href="{{route('cp_user_show' , ['id'=>$user->id])}}">  {{$user->name  }}</a>  </td>
                                        <td>
                                            @if( $user->confirm == 1 )
                                                <span class="badge badge-success">تایید شده</span>
                                            @else
                                                <span class="badge badge-danger">تایید نشده</span>

                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                                </table>
                            @endif
                    </div>
                </div>
            </div>


            <div class="col-md-4 col-12">
                <div class="card">
                    <div class="card-header">تیکت های امروز</div>
                    <div class="card-body">
                            @if($today_data['tickets']->isEmpty())
                                <div class="alert alert-warning">موردی موجود ندارد</div>
                            @else
                                <table class="table">
                                @foreach($today_data['tickets'] as $ticket )
                                        <tr  class="item-row">
                                            <td width="80%">  <a href="{{route('cp_show_ticket' , ['id'=>$ticket->id])}}" > {{$ticket->title}} </a>  </td>
                                            <td>
                                                @if($ticket->admin_alert == 1 )
                                                    <span class="badge badge-danger btn-xs">جدید</span>
                                                @else
                                                    <span class="badge badge-dark btn-xs">خوانده شده</span>
                                                @endif
                                            </td>

                                        </tr>
                                @endforeach
                                </table>
                            @endif
                    </div>
                </div>
            </div>



            <div class="col-md-4 col-12">
                <div class="card">
                    <div class="card-header">درخواست های امروز</div>
                    <div class="card-body">
                            @if($today_data['services']->isEmpty())
                                <div class="alert alert-warning">موردی موجود ندارد</div>
                            @else
                                <table class="table">
                                @foreach($today_data['services'] as $service )
                                        <tr  class="item-row">
                                            <td>  <a href="{{route('cp_user_show' , ['id'=>$service->user_id])}}"> {{$service->User->mobile}} </a>  </td>
                                            <td>
                                                @if($service->seen == 0 )
                                                    <span class="badge badge-danger">درخواست جدید</span>
                                                @else
                                                    <span class="badge badge-dark">دیده شده</span>
                                                @endif
                                            </td>
                                            <td>  <a class="btn btn-primary btn-sm" href="{{route('cp_service_show' ,['id'=>$service->id])}}">مشاهده</a> </td>

                                        </tr>
                                @endforeach
                                </table>
                            @endif
                    </div>
                </div>
            </div>







        </div>
    </div>


@endsection
