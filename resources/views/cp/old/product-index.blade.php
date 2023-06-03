@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12" style="text-align:right ; direction:rtl">
                        <a class="btn btn-dark" href="{{route('product.create')}}"> ثبت محصول جدید</a>

                    </div>




                </div>

            </div>
            <div class="card-body">


                @if( !$products->isEmpty()  )


                    <table class="table table-borderless  table-striped ">
                        <thead>
                        <tr>
                            <th width="100px">تصویر </th>
                            <th>عنوان </th>
                            <th> تاریخ  </th>
                            <th> ویرایش </th>
                            <th> حذف </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($products  as $k=>$product   )
                            <tr  class="item-row">
                                <td>  <img src=" {{upload_url("$product->image")}}" style="width: 100px"> </td>
                                <td>   <a href="{{route('product.show.cp' , ['id'=>$product->id])}}">{{$product->title}}</a> </td>
                                <td> {{jdate($product->created_at)}} </td>
                                <td> <a href="{{route('product.edit' , ['id'=>$product->id])}}" class="btn btn-info"> ویرایش</a> </td>
                                <td>
                                    {!! button( ['attr'=> [ 'class' => 'btn btn-danger global-delete-btn'  , 'data-wrapper'=>'tr' ,  'data-route'=> route('product.delete' ,['id'=>$product->id ]) ],'text'=>'حذف' ]) !!}
                                </td>

                            </tr>
                        @endforeach



                        </tbody>
                    </table>
                    {!! $products->links() !!}

                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection
