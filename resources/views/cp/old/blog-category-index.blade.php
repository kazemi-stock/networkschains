@extends('cp.master')


@section('main')

    <div class="white-box " >
        <div class="header ">
            <div class="padding">
                <div class="row">

                    <div class="col-md-10 pull-right" style="padding: 0px">
                        <ol class="breadcrumb " style="text-align: right ; background-color: white ">

                            @foreach(($category_line) as $k=>$v)
                                <li><a href="{{route('blog_category_index_cp' , ['parent_id'=>$v->parent_id])}}"> {{$v->title}}</a></li>
                            @endforeach
                                <li><a href="{{route('blog_category_index_cp' )}}">ریشه </a></li>

                        </ol>
                    </div>
                    <div class="col-md-2" style=" text-align: left">
                        <a class="btn btn-grey" href="{{route('blog_category_make_cp' , ['parent_id'=>$parent_id])}}"  ><i class="fa fa-plus"></i> ثبت دسته بندی جدید</a>
                    </div>
                </div>

            </div>

        </div>
        <div class="padding">
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

                            <td> <a class="btn btn-sm btn-pink"  href="{{route('blog_category_index_cp' , ['parent_id'=>$c->id])}}"> مشاهده </a> </td>

                            <td>  {!! edit_btn(route('blog_category_edit_cp' , ['id'=>$c->id ])) !!}
                                {!! delete_btn( $c->id ,  route('blog_category_destroy_cp')) !!}
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


@endsection
