@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12 cooler-wrapper" style="text-align:right ; direction:rtl">
                        <form  method="get " class="row">


                            <div class="col-md-3 pull-right" >
                                <label  class="filter-label">عنوان </label>
                                <input type="text"  data-id="title" class="form-control " >
                            </div>

                            <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                <a class="btn btn-success cooler-save-btn" data-route="{{route('cp_setting_cooler_update')}}"  >
                                    <span class="nospiner">  ثبت کولر جدید</span>
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


                @if( !$coolers->isEmpty()  )


                    <table class="table  ">
                        <thead>
                        <tr>
                            <th> عنوان  </th>
                            <th> ویرایش </th>
                            <th> حذف </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($coolers as $k=>$cooler  )
                            <tr  class="item-row">
                                <td> {{$cooler->title}}  </td>
                                <td> <a class="btn btn-info cooler-edit-btn" data-id="{{$cooler->id}}">ویرایش</a>  </td>
                                <td> <a class="btn btn-danger destroy-item-btn" data-id="{{$cooler->id}}" data-route="{{route('cp_setting_cooler_delete' ,['id'=>$cooler->id])}}">حذف</a>  </td>

                            </tr>
                            <tr class="edit-tr" data-id="{{$cooler->id}}" style="display: none">
                                <td colspan="6">
                                    <div class="row">
                                        <div class="col-md-12 cooler-wrapper" style="text-align:right ; direction:rtl">
                                            <form  method="get " class="row">


                                                <div class="col-md-3 pull-right" >
                                                    <label  class="filter-label">از ساعت </label>
                                                    <input type="text"  data-id="title" class="form-control " value="{{$cooler->title}}" >
                                                </div>


                                                <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                                    <a class="btn btn-dark cooler-save-btn" data-route="{{route('cp_setting_cooler_update' ,['id'=>$cooler->id ])}}"  >
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


        $(document).on('click' , '.cooler-edit-btn' , function(){

            let id =$(this).data('id');
            $(`.edit-tr[data-id="${id}"]`).toggle();
        });
        $(document).on('click' , '.cooler-save-btn' , function(){
            let data = {  } ;
            $(this).parents('.cooler-wrapper:first').find('.form-control').each(function () {
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