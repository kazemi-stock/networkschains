@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12 bank-wrapper" style="text-align:right ; direction:rtl">
                        <form  method="get " class="row">


                            <div class="col-md-3 pull-right" >
                                <label  class="filter-label">نام بانک </label>
                                <input type="text"  data-id="bank_name" class="form-control " >
                            </div>
                            <div class="col-md-3 pull-right" >
                                <label  class="filter-label">نام صاحب حساب </label>
                                <input type="text"  data-id="owner_name" class="form-control " >
                            </div>



                            <div class="col-md-3 pull-right" >
                                <label  class="filter-label">شماره کارت </label>
                                <input type="text"  data-id="card_num" class="form-control " >
                            </div>


                            <div class="col-md-3 pull-right" >
                                <label  class="filter-label">شماره شبا </label>
                                <div class="input-group">
                                    <input type="text" class="form-control shaba text-left" data-id="shaba"  aria-describedby="basic-addon1">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">IR</span>
                                    </div>

                                </div>
                            </div>




                            <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                <a class="btn btn-success bank-setting-save" data-route="{{route('cp_setting_bank_account_store')}}"  >
                                    <span class="nospiner">  ثبت حساب جدید</span>
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


                @if( !$accounts->isEmpty()  )


                    <table class="table table-borderless  table-striped ">
                        <thead>
                        <tr>
                            <th> بانک  </th>
                            <th>صاحب حساب </th>
                            <th>کارت </th>
                            <th> شبا </th>
                            <th> ویرایش </th>
                            <th> حذف </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($accounts as $k=>$account  )
                            <tr  class="item-row">
                                <td> {{$account->bank_title}}  </td>
                                <td> {{$account->account_owner}}  </td>
                                <td> {{$account->card_num}}  </td>
                                <td> {{$account->shaba}}  </td>
                                <td> <a class="btn btn-info site-bank-edit-btn" data-id="{{$account->id}}">ویرایش</a>  </td>
                                <td> <a class="btn btn-danger destroy-item-btn" data-id="{{$account->id}}" data-route="{{route('cp_setting_bank_account_delete')}}">حذف</a>  </td>

                            </tr>
                            <tr class="edit-tr" data-id="{{$account->id}}" style="display: none">
                                <td colspan="6">
                                    <div class="row">
                                        <div class="col-md-12 bank-wrapper" style="text-align:right ; direction:rtl">
                                            <form  method="get " class="row">


                                                <div class="col-md-3 pull-right" >
                                                    <label  class="filter-label">نام بانک </label>
                                                    <input type="text"  data-id="bank_name" class="form-control " value="{{$account->bank_title}}" >
                                                </div>
                                                <div class="col-md-3 pull-right" >
                                                    <label  class="filter-label">نام صاحب حساب </label>
                                                    <input type="text"  data-id="owner_name" class="form-control " value="{{$account->account_owner}}">
                                                </div>



                                                <div class="col-md-3 pull-right" >
                                                    <label  class="filter-label">شماره کارت </label>
                                                    <input type="text"  data-id="card_num" class="form-control " value="{{$account->card_num}}">
                                                </div>


                                                <div class="col-md-3 pull-right" >
                                                    <label  class="filter-label">شماره شبا </label>
                                                    <div class="input-group">
                                                        <input type="text"  value="{{$account->shaba}}" class="form-control shaba text-left" data-id="shaba"  aria-describedby="basic-addon1">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="basic-addon1">IR</span>
                                                        </div>

                                                    </div>
                                                </div>




                                                <div class="col-md-2 pull-right" style="padding-top: 27px  ;text-align: right">
                                                    <a class="btn btn-dark bank-setting-save" data-route="{{route('cp_setting_bank_account_update' ,['id'=>$account->id ])}}"  >
                                                        <span class="nospiner">  ویرایش حساب </span>
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


        $(document).on('click' , '.site-bank-edit-btn' , function(){

            let id =$(this).data('id');
            $(`.edit-tr[data-id="${id}"]`).toggle();
        });
        $(document).on('click' , '.bank-setting-save' , function(){
            let data = {  } ;
            $(this).parents('.bank-wrapper:first').find('.form-control').each(function () {
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