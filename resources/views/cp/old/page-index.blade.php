@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12" style="text-align:right ; direction:rtl">
                        <a class="btn btn-dark" href="{{route('cp_page_create')}}"> ثبت صفحه جدید</a>

                    </div>




                </div>

            </div>
            <div class="card-body">


                @if( !$pages->isEmpty()  )


                    <table class="table table-borderless  table-striped ">
                        <thead>
                        <tr>
                            <th>عنوان </th>
                            <th> تاریخ  </th>
                            <th> ویرایش </th>
                            <th> حذف </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($pages  as $k=>$page   )
                            <tr  class="item-row">
                                <td>   {{$page->title}} </td>
                                <td> {{jdate($page->created_at)}} </td>
                                <td> <a href="{{route('cp_page_edit' , ['id'=>$page->id])}}" class="btn btn-info"> ویرایش</a> </td>
                                <td> {!! delete_btn( $page->id ,  route('cp_page_delet')) !!}  </td>

                            </tr>
                        @endforeach



                        </tbody>
                    </table>

                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection