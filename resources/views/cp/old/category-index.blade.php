@extends('cp.master')


@section('main')


    <div class="container-fluid">
        <div class="card dark-card " >
            <div class="card-header ">
                <div class="padding">
                    <div class="row">
                    <div class="col-md-10 pull-right" style="padding: 0px">
                        <ol class="breadcrumb " style="text-align: right ; background-color: inherit ">
                            @foreach($category_line as $k=>$v)
                                <li><a href="{{route('category_index_cp' , ['parent_id'=>$v->parent_id])}}">{{$v->title}}</a></li>
                                <li> <i class="mdi mdi-chevron-left"></i> </li>
                            @endforeach
                            <li><a href="{{route('category_index_cp' )}}">ریشه </a></li>
                        </ol>
                    </div>
                    <div class="col-md-2" style=" text-align: left">
                        <a class="btn btn-danger" href="{{route('category_make_cp' , ['parent_id'=>$parent_id])}}"  ><i class="fa fa-plus"></i> ثبت دسته بندی جدید</a>
                    </div>
                    </div>

                </div>

            </div>
            <div class="card-body">
            @if( !$caegories->isEmpty()  )
                        <table class="table table-hover table-striped   table-white">
                        <thead>
                        <tr><th> عنوان  </th>

                                <th>زیر دسته ها </th>

                           <th> ابزار</th> </tr>
                        </thead>
                        <tbody>
                        @foreach($caegories as $c  )
                            <tr  class="item-row">
                                <td>
                                    {{$c->title}}
                                </td>

                                    <td> <a class="btn btn-info "  href="{{route('category_index_cp' , ['parent_id'=>$c->id])}}"> مشاهده </a> </td>


                                <td>  {!! edit_btn(route('category_edit_cp' , ['id'=>$c->id ])) !!}
                                    {!! delete_btn( $c->id ,  route('category_destroy_cp')) !!}
                                </td>
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
