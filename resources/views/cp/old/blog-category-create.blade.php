@extends('cp.master')


@section('main')

    <Div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb " style="text-align: right">
                @foreach(category_line($parent_id) as $k=>$v)
                    <li><a href="{{route('blog_category_index_cp' , ['parent_id'=>$v->parent_id])}}">{{$v->title}}</a></li>
                @endforeach
            </ol>
        </div>

        <div class="col-md-2">

        </div>


    </Div>

    <hr />


    <div id="form-make-wrapper">


        <div class="panel panel-grey box-toggle-wrapper">
            <div class="panel-heading">
                عنوان
                <br style="clear:both;">
            </div>
            <div class="panel-body pan box-toggle-object">
                <div class="form-body pal">

                    <div class="row" >
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label>عنوان </label>
                                    <input type="text" class="form-control"  id="title" value="{{$edit ? $edit->title : '' }}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-icon">
                                    <label> لینک </label>
                                    <input type="text" class="form-control"  id="slug" value="{{$edit ? $edit->slug : '' }}">
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>



        <div class="row" style="padding:15px">


            {!! csrf_field() !!}
            <a onclick="javascript:saving_offer_item()"  class="btn  btn-green pull-right" href="javascript:void(0)" id="save-form-btn">  {{$edit ? 'ویرایش' : 'ثبت' }} دسته بندی </a>
        </div>

        <script>


            function get_data(){
                var obj = {};
                $('#form-make-wrapper').find('.form-control').each(function () {
                    obj[$(this).attr('id')] = this.value;
                })
                obj['parent_id'] = '{{$parent_id}}';

                return obj;
            }

            var inprog = false;
            function saving_offer_item()
            {
                inprog = true ;
                $('#save-form-btn').button('loading');

                var url =  '{{ $edit ? route('blog_category_update' , ['id' => $edit->id ]):route('blog_category_store' )}}';

                var obj = get_data();

                $.post(url , csrf(obj)  , function(data){
                    $('#save-form-btn').button('reset');
                    data = $.parseJSON(data);
                    if(data.stat == 'ok')
                    {
                        ok('با موفقیت انجام شد ');
                        document.location = '{{route('blog_category_index_cp' , $parent_id > 0 ? ['parent_id'=>$parent_id] : '' )}}';

                    }

                    else
                    {
                        $('#save-form-btn').button('reset');
                        er(data.msg);
                    }
                })
            }



        </script>

    </div>


@endsection
