@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">

                    <div class="col-md-8 pull-right" style="text-align:right ; direction:rtl">
                        <form  class="row">


                            <div class="col-md-8 pull-right" >
                                <label class="filter-label">  عنوان </label>
                                <input type="text"  name="title" class="form-control "  value="{{Request::input('title')}}">
                            </div>


                            <div class="col-md-4 pull-right" style="padding-top: 30px  ;text-align: right">
                                <button class="btn btn-secondary" type="submit">فیلتر</button>
                            </div>
                        </form>

                    </div>
                    <div class="col-md-4 pull-left text-left">
                        <a class="btn btn-primary pull-left" href="{{route('blog_create_cp')}}" style="margin-right: 5px ">ثبت مقاله جدید</a>
                    </div>
                </div>

            </div>
            <div class="card-body">


                @if( !$blogs->isEmpty()  )
                    <table class="table table-hover table-striped  table-white">
                        <thead>
                        <tr><th width="110px"> تصویر  </th> <th> عنوان  </th> <th> تاریخ </th><th> پیش نمایش </th><th> ابزار</th> </tr>
                        </thead>
                        <tbody>
                        @foreach($blogs as $blog  )
                            <tr  class="item-row">
                                <td>
                                    <img src="{{upload_url($blog->image)}}" style="max-height: 100px ; max-width: 100px">
                                </td>
                                <td>
                                    {{$blog->title}}
                                </td>
                                <td> {{jdate($blog->created_at)}} </td>
                                <td> <a class="btn btn-dark" target="_blank" href="{{route('blog_show' ,['url'=>$blog->url])}}">پیش نمایش</a> </td>
                                <td>

                                    {!! edit_btn(route('blog_create_cp' , ['id'=>$blog->id ])) !!}
                                    {!! delete_btn( $blog->id ,  route('blog_destroy_cp')) !!}
                                </td>
                            </tr>
                        @endforeach



                        </tbody>
                    </table>

                    {{$blogs->links()}}
                @else

                    {!! empty_query() !!}

                @endif

            </div>
        </div>


    </div>


@endsection
