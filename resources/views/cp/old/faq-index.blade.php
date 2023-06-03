@extends('cp.master')

@section('main')
    <script>
        $(document).on('click' , '.faq-save-btn' , function(){
            var obj = {
                title : $(this).parents('.faq-card:first').find('.faq-title').val() ,
                text : $(this).parents('.faq-card:first').find('.faq-text').val() ,
            }
            let btn = $(this);
            loadspiner(btn);
            $.post(btn.data('route') , csrf(obj) , function (data) {

                data = $.parseJSON(data);
                unloadspiner(btn)
                if(data.stat == 'ok')
                {
                    let html = $(data.html);
                    $('#main-faq-wrapper').html(html.find('#main-faq-wrapper').html());

                }
                else
                {
                    er(data.msg);
                }

            })
        })
    </script>
    <div class="container-fluid" id="main-faq-wrapper">

        <div class="card ">
            <div class="border-bottom">
                <div class="row faq-card">
                    <div class="col-md-12 text-right" >
                        <div class="form-group">
                            <div class="input-icon">
                                <label>عنوان </label>
                                <input type="text" class="form-control faq-title"   >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 text-right" >
                        <div class="form-group">
                            <div class="input-icon">
                                <label>توضیحات </label>
                                <textarea  class="form-control faq-text" ></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 text-right" >
                        <a class="btn btn-success faq-save-btn"  data-route="{{route('cp.faq.store')}}" >
                            <span class="nospiner">  ثبت سوال جدید</span>
                            <div class="spinner-border   spiner" role="status" >
                                <span class="sr-only"></span>
                            </div>
                        </a>

                    </div>

                </div>


            </div>
            <div class="card-body">


                @if( !$faqs->isEmpty()  )


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
                        @foreach($faqs  as $k=>$faq   )
                            <tr  class="item-row">
                                <td>   {{$faq->title}}

                                    <div class="row faq-card " style="display: none">
                                        <div class="col-md-12 text-right" >
                                            <div class="form-group">
                                                <div class="input-icon">
                                                    <label>عنوان </label>
                                                    <input type="text" class="form-control faq-title"  value="{{$faq->title}}"  >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 text-right" >
                                            <div class="form-group">
                                                <div class="input-icon">
                                                    <label>توضیحات </label>
                                                    <textarea  class="form-control faq-text" >{{$faq->text}}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 text-right" >
                                            <a class="btn btn-success faq-save-btn"  data-route="{{route('cp.faq.update' ,['id'=>$faq->id])}}" >
                                                <span class="nospiner">   ویرایش سوال</span>
                                                <div class="spinner-border   spiner" role="status" >
                                                    <span class="sr-only"></span>
                                                </div>
                                            </a>

                                        </div>

                                    </div>



                                </td>
                                <td> {{jdate($faq->created_at)}} </td>
                                <td> <a href="javascript:void(0)" onclick="$(this).parents('.item-row').find('.faq-card').toggle()" class="btn btn-info pjax"> ویرایش</a> </td>
                                <td> <a href="javascript:void(0)" data-route="{{route('cp.faq.delete' , ['id'=>$faq->id])}}" class="btn btn-danger global-delete-btn" data-wrapper=".item-row"> حذف</a> </td>

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
