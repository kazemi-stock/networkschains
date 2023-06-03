@extends('cp.master')



@section('main')

    <div class="container-fluid">


        <div class="row">

            <div class="col-md-12 col-12 float-right pull-right">
                <div class="card gray-card no-shadow" >

                    <div class="border-bottom">
                        <h4 class="card-title">ثبت نتیجه پرداخت</h4>
                        <ul>
                            <li>#{{$payment->id}}</li>
                            <li> {{$payment->tag}}</li>
                            <li> {{$payment->amount}}</li>
                            <li> <a href="{{route('cp_user_show' , ['id'=>$payment->User->id])}}"> {{$payment->User->Alias()}} </a> </li>
                        </ul>
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


                        {!! button( ['attr'=> [ 'class' => 'btn btn-primary store-btn'  , 'data-selector'=>'.response-input' ,  'data-route'=> route('cp.crypto.response.store' ,['id'=>$payment->id]) ],'text'=>'ثبت نهایی ' ]) !!}

                    </div>
                </div>
            </div>



        </div>

    </div>



@endsection
