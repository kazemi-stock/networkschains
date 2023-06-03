@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12" style="text-align:right ; direction:rtl">
                        <form  method="get" class="row">


                            <div class="col-md-2 pull-right" >
                                <label  class="filter-label"> شناسه کاربر</label>
                                <input type="text"  name="uid" class="form-control " value="{{Request::input('uid')}}" >
                            </div>


                            <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                <button class="btn btn-primary" type="submit">فیلتر</button>
                            </div>
                        </form>

                    </div>




                </div>

            </div>
            <div class="card-body">


                @if( !$tickets->isEmpty()  )


                    <table class="table table-borderless  table-striped ">
                        <thead>
                        <tr>
                            <th> کاربر  </th>
                            <th>عنوان </th>
                            <th> تاریخ ارسال </th>
                            <th> وضعیت </th>
                            <th> مشاهده </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($tickets as $k=>$ticket  )
                            <tr  class="item-row">
                                 <td>  <a href="{{route('cp_user_show' , ['id'=>$ticket->User->id])}}"> {{$ticket->User->mobile}} </a>  </td>
                                <td>  {{$ticket->title}}   </td>
                                <td> {{jdate($ticket->created_at)}} </td>
                                <td>
                                    @if($ticket->admin_alert == 1 )
                                        <span class="badge badge-danger">جدید</span>
                                    @else
                                        <span class="badge badge-dark">خوانده شده</span>
                                    @endif
                                </td>
                                <td> <a href="{{route('cp_show_ticket' , ['id'=>$ticket->id])}}" class="btn btn-info"> مشاهده</a> </td>

                            </tr>
                        @endforeach



                        </tbody>
                    </table>

                    {{$tickets->links()}}
                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection