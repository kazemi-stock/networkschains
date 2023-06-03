@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12 timing-wrapper" style="text-align:right ; direction:rtl">
                        <form  method="get " class="row">


                            <div class="col-md-3 pull-right" >
                                <label  class="filter-label">از ساعت </label>
                                <input type="text"  data-id="from" class="form-control " >
                            </div>
                            <div class="col-md-3 pull-right" >
                                <label  class="filter-label">تا ساعت </label>
                                <input type="text"  data-id="to" class="form-control " >
                            </div>





                            <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                <a class="btn btn-success timing-save-btn" data-route="{{route('cp_setting_working_hour_update')}}"  >
                                    <span class="nospiner">  ثبت باز جدید</span>
                                    <div class="spinner-border   spiner" role="status" >
                                        <span class="sr-only"></span>
                                    </div>
                                </a>


                            </div>
                        </form>

                    </div>




                </div>

            </div>



            <div class="card-body">


                @if( !$timings->isEmpty()  )


                    <table class="table  ">
                        <thead>
                        <tr>
                            <th> از ساعت  </th>
                            <th>تا ساعت  </th>
                            <th> ویرایش </th>
                            <th> حذف </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($timings as $k=>$timing  )
                            <tr  class="item-row">
                                <td> {{$timing->from}}  </td>
                                <td> {{$timing->to}}  </td>
                                <td> <a class="btn btn-info timing-edit-btn" data-id="{{$timing->id}}">ویرایش</a>  </td>
                                <td> <a class="btn btn-danger destroy-item-btn" data-id="{{$timing->id}}" data-route="{{route('cp_setting_working_hour_delete' ,['id'=>$timing->id])}}">حذف</a>  </td>

                            </tr>
                            <tr class="edit-tr" data-id="{{$timing->id}}" style="display: none">
                                <td colspan="6">
                                    <div class="row">
                                        <div class="col-md-12 timing-wrapper" style="text-align:right ; direction:rtl">
                                            <form  method="get " class="row">


                                                <div class="col-md-3 pull-right" >
                                                    <label  class="filter-label">از ساعت </label>
                                                    <input type="text"  data-id="from" class="form-control " value="{{$timing->from}}" >
                                                </div>
                                                <div class="col-md-3 pull-right" >
                                                    <label  class="filter-label">تا ساعت </label>
                                                    <input type="text"  data-id="to" class="form-control " value="{{$timing->to}}">
                                                </div>


                                                <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                                    <a class="btn btn-dark timing-save-btn" data-route="{{route('cp_setting_working_hour_update' ,['id'=>$timing->id ])}}"  >
                                                        <span class="nospiner">  ویرایش  </span>
                                                        <div class="spinner-border   spiner" role="status" >
                                                            <span class="sr-only"></span>
                                                        </div>
                                                    </a>


                                                </div>
                                            </form>

                                        </div>




                                    </div>

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
    <script>


        $(document).on('click' , '.timing-edit-btn' , function(){

            let id =$(this).data('id');
            $(`.edit-tr[data-id="${id}"]`).toggle();
        });
        $(document).on('click' , '.timing-save-btn' , function(){
            let data = {  } ;
            $(this).parents('.timing-wrapper:first').find('.form-control').each(function () {
                data[$(this).data('id')] = this.value ;
            })

            var btn = $(this);

            loadspiner( btn);
            $.post( btn.data('route') , csrf(data) , function(data){
                unloadspiner(btn);
                data = $.parseJSON(data);
                if(data.stat == 'ok')
                {
                    document.location = document.location ;
                }
                else
                    er(data.msg);
            });

        })
    </script>



@endsection