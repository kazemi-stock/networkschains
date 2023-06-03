@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12" style="text-align:right ; direction:rtl">
                        صندوق متخصصان فروش
                    </div>

                </div>
            </div>
            <div class="card-body">


                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label for="fname" class="col-sm-12 text-right control-label col-form-label yekan" >امتیاز کل</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control com-input" data-id="point" >
                            </div>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <div class="col-md-12">
                        {!! button( ['attr'=> [ 'class' => 'btn btn-primary store-btn'  , 'data-selector'=>'.com-input' ,  'data-route'=> route('cp.commission.store.professional') ],'text'=>'ثبت نهایی ' ]) !!}
                    </div>
                </div>


            </div>
        </div>


    </div>


@endsection
