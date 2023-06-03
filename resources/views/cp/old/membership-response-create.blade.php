@extends('cp.master')



@section('main')

    <div class="container-fluid">


        <div class="row">

            <div class="col-md-12 col-12 float-right pull-right">
                <div class="card gray-card no-shadow" >

                    <div class="border-bottom">
                        <h4 class="card-title">ثبت نتیجه درخواست عضویت</h4>
                    </div>

                    <div class="card-body">

                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" >  نتیجه</label>
                            <div class="col-sm-9">
                                {!! select(['accept'=>'تایید شد'  , 'deny'=>'رد شد' ] , ['data-id'=>'result' ,'class'=>'response-input form-control'] , 'accept' ,0 ) !!}
                            </div>
                        </div>
                        <hr />
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" > توضیحات در صورت نیاز</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control response-input" data-id="text" value="">
                            </div>
                        </div>
                        <hr />


                        {!! button( ['attr'=> [ 'class' => 'btn btn-primary store-btn'  , 'data-selector'=>'.response-input' ,  'data-route'=> route('cp.membership.response.store' ,['id'=>$mem_req->id]) ],'text'=>'ثبت نهایی ' ]) !!}

                    </div>
                </div>
            </div>



        </div>

    </div>



@endsection
