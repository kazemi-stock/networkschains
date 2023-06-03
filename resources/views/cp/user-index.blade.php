@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-10" style="text-align:right ; direction:rtl">
                        <form  method="get" class="row">



                            <div class="col-md-2 pull-right" >
                                <label  class="filter-label">ایمیل</label>
                                <input type="text"  name="email" class="form-control " value="{{Request::input('email')}}">
                            </div>


                            <div class="col-md-2 pull-right" >
                                <label  class="filter-label"> نوع کاربر </label>
                                {!! select(['user'=>'کاربر عادی' ,'admin'=>'اپراتور' , 'superadmin'=>'مدیر کل'   ] , ['name'=>'role'] , Request::input('role') , 1 , 'همه کاربر ها' ) !!}
                            </div>
                            <div class="col-md-2 pull-right" >
                                <label  class="filter-label"> مرتب سازی </label>
                                {!! select($sort_filters , ['name'=>'sort'] , $query_sort['col'] , 0 ) !!}
                            </div>

                            <div class="col-md-2 pull-right" >
                                <label  class="filter-label">  نوع مرتب سازی </label>
                                {!! select($sort_types , ['name'=>'sort_type'] , $query_sort['type'] , 0 ) !!}
                            </div>


                            <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                <button class="btn btn-primary" type="submit">فیلتر</button>
                            </div>
                        </form>

                    </div>




                </div>

            </div>
            <div class="card-body">


                @if( !$users->isEmpty()  )


                    <table class="table table-borderless  table-striped ">
                        <thead>
                        <tr>
                            <th> ردیف </th>
                            <th>نام </th>
                            <th>ایمیل </th>
                            <th> تاریخ ثبت نام </th>
                            <th> وضعیت </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($users as $k=>$user  )
                            <tr  class="item-row">
                                <td> {{row($k)}} </td>
                                <td>  <a href="{{route('cp_user_show' , ['id'=>$user->id])}}">  {{$user->name  }}</a>  </td>
                                <td>  <a href="{{route('cp_user_show' , ['id'=>$user->id])}}">  {{$user->email  }}</a>  </td>
                                <td> {{jdate($user->created_at)}} </td>
                                <td>
                                    @if( $user->email_verified_at  )
                                        <span class="badge badge-success">تایید شده</span>
                                    @else
                                        <span class="badge badge-danger">تایید نشده</span>

                                    @endif
                                </td>

                            </tr>
                        @endforeach



                        </tbody>
                    </table>

                    {{$users->links()}}
                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection
