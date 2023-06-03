@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
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
