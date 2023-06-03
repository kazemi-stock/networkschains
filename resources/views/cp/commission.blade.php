@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12" style="text-align:right ; direction:rtl">
                        <a class="btn btn-dark" href="{{route('cp.commission.create.general')}}"> ثبت کمیسون صندوق های 4 گانه</a>
                        <a class="btn btn-danger" href="{{route('cp.commission.create.professional')}}" href="#"> ثبت کمیسون صندوق متخصصان حرفه ای فروش </a>

                    </div>




                </div>

            </div>
            <div class="card-body">


                @if( !$commisions->isEmpty()  )


                    <table class="table table-borderless  table-striped ">
                        <thead>
                        <tr>
                            <th>شناسه </th>
                            <th>ثبت کننده </th>
                            <th> تاریخ ثبت  </th>
                            <th> تاریخ شروع دوره  </th>
                            <th> تاریخ پایان دوره  </th>
                            <th> مشاهده </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($commisions  as $k=>$commision   )
                            <tr  class="item-row">
                                <td>   {{$commision->id}} </td>
                                <td>   {{$commision->Admin->name}} </td>
                                <td> {{jdate($commision->created_at)}} </td>
                                <td> {{strtotime($commision->date_from) > 0 ? jdate($commision->date_from) : '-'  }}  </td>
                                <td> {{strtotime($commision->date_to) > 0 ? jdate($commision->date_to) : '-'  }}  </td>
                                <td> <a href="{{route('cp.commission.show' , ['id'=>$commision->id])}}" class="btn btn-info"> مشاهده</a> </td>

                            </tr>
                        @endforeach



                        </tbody>
                    </table>
                    {!! $commisions->links() !!}

                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection
