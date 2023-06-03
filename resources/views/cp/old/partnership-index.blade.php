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


                @if( !$requests->isEmpty()  )


                    <table class="table table-borderless  table-striped ">
                        <thead>
                        <tr>
                            <th> شناسه  </th>
                            <th> تصویر  </th>
                            <th> کاربر  </th>
                            <th> تاریخ ارسال </th>
                            <th> وضعیت </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($requests as $member_request )
                            <tr  class="item-row">
                                <td> {{$member_request->id}} </td>
                                <td> <a href="{{upload_url($member_request->image)}}" target="_blank"><img src="{{upload_url($member_request->image)}}" style="width: 100px"></a> </td>
                                <td>  <a href="{{route('cp_user_show' , ['id'=>$member_request->User->id])}}"> {{$member_request->User->Alias()}} </a>  </td>

                                <td> {{jdate($member_request->created_at)}} </td>
                                <td>
                                    @if($member_request->Response  )
                                        @if($member_request->Response->type == 'accept')

                                            <div class="alert alert-success">
                                                <ul>
                                                    <li> تایید شد</li>
                                                    <li> تاریخ : {{jdate($member_request->Response->created_at)}} </li>
                                                    <li> مدیر : {{($member_request->Response->Admin->name)}} </li>
                                                    <li> توضیحات : {{($member_request->Response->text)}} </li>
                                                </ul>
                                            </div>
                                        @elseif($member_request->Response->type == 'deny')
                                            <div class="alert alert-danger">
                                                <ul>
                                                    <li> رد شد</li>
                                                    <li> تاریخ : {{jdate($member_request->Response->created_at)}} </li>
                                                    <li> مدیر : {{($member_request->Response->Admin->name)}} </li>
                                                    <li> توضیحات : {{($member_request->Response->text)}} </li>
                                                </ul>
                                            </div>

                                        @endif

                                    @else
                                        <a class="btn btn-info" href="{{route('cp.partnership.response.create' ,['id'=>$member_request->id ])}}"> ثبت پاسخ </a>
                                    @endif
                                </td>

                            </tr>
                        @endforeach



                        </tbody>
                    </table>

                    {{$requests->links()}}
                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection
