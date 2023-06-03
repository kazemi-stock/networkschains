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

                            <div class="col-md-3 pull-right" >
                                <label  class="filter-label"> از تاریخ</label>
                                <input type="text"  name="from" autocomplete="off"  class="form-control date" value="{{Request::input('from')}}" >
                            </div>

                            <div class="col-md-3 pull-right" >
                                <label  class="filter-label"> تا  تاریخ</label>
                                <input type="text"  name="to" autocomplete="off" class="form-control date" value="{{Request::input('to')}}" >
                            </div>


                            <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                <button class="btn btn-primary" type="submit">فیلتر</button>
                            </div>
                        </form>

                    </div>




                </div>

            </div>
            <div class="card-body">


                @if( !$purchases->isEmpty()  )

                    <span class="btn btn-success" style="border-radius: 30px">جمع کل : {{$total}}</span>


                    <table class="table table-borderless  table-striped ">
                        <thead>
                        <tr>
                            <th> کاربر  </th>
                            <th> توضیحات  </th>
                            <th> مبلغ  </th>
                            <th>اعتبار  </th>
                            <th> تاریخ  </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($purchases as $k=>$purchase  )
                            <tr  class="item-row">
                                <td>  <a href="{{route('cp_user_show' , ['id'=>$purchase->User->id])}}"> {{$purchase->User->Alias()}} </a>  </td>
                                <td> {{(price($purchase->Invoice->price , 'ir'))}} </td>
                                <td> {{(price($purchase->amount))}} </td>
                                <td> {{jdate($purchase->created_at)}} </td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>

                    {{$purchases->links()}}
                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection
