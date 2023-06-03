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

                    {{$payments->links()}}
                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection
