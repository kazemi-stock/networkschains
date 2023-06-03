@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="card-body">


                @if( !$withdraws->isEmpty()  )
                    <table class="table table-borderless  table-striped ">
                        <thead>
                        <tr>
                            <th> شناسه  </th>
                            <th> کاربر  </th>
                            <th> مبلغ </th>
                            <th> تاریخ  </th>
                            <th> وضعیت </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($withdraws as $withdraw )
                            <tr  class="item-row">
                                <td> {{$withdraw->id}} </td>
                                <td>  <a href="{{route('cp_user_show' , ['id'=>$withdraw->User->id])}}"> {{$withdraw->User->Alias()}} </a>  </td>
                                 <td> {{$withdraw->amount}} </td>
                                <td> {{jdate($withdraw->created_at)}} </td>
                                <td>
                                    @if($withdraw->Success  )
                                        <div class="alert alert-success">
                                            <ul>
                                                <li> تایید شد</li>
                                                <li> تاریخ : {{jdate($withdraw->Success->created_at)}} </li>
                                                <li> مدیر : {{($withdraw->Success->Admin->Alias())}} </li>
                                             </ul>
                                        </div>

                                    @else
                                        {!! button( ['attr'=> [ 'class' => 'btn btn-primary store-btn'  , 'data-selector'=>'.withdraw-input' ,  'data-route'=> route('cp.withdraw.success.store' ,['id'=>$withdraw->id]) ],'text'=>'ثبت واریزی ' ]) !!}
                                    @endif
                                </td>

                            </tr>
                        @endforeach



                        </tbody>
                    </table>

                    {{$withdraws->links()}}
                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection
