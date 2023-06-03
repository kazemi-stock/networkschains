@extends('cp.master')

@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-12" style="text-align:right ; direction:rtl">


                        جمع امتیازات
                      <a class="btn btn-success">  {{$PurchasePoint}}</a>
                    </div>

                </div>
            </div>
            <div class="card-body">


                <div class="row">

                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">درصد استخر 1</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-12 text-right control-label col-form-label yekan" >درصد</label>
                                        <div class="col-sm-12">
                                            <input type="text" class="form-control com-input" data-id="pool_1" value="3">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">درصد استخر 2</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-12 text-right control-label col-form-label yekan" >درصد</label>
                                        <div class="col-sm-12">
                                            <input type="text" class="form-control com-input" data-id="pool_2" value="4">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">درصد استخر 3</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-12 text-right control-label col-form-label yekan" >درصد</label>
                                        <div class="col-sm-12">
                                            <input type="text" class="form-control com-input" data-id="pool_3"  value="2">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>




                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">درصد استخر 5</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-12 text-right control-label col-form-label yekan" >درصد</label>
                                        <div class="col-sm-12">
                                            <input type="text" class="form-control com-input" data-id="pool_5" value="5" >
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>



                </div>

                <hr />

                <div class="row">
                    <div class="col-md-12">
                        {!! button( ['attr'=> [ 'class' => 'btn btn-primary store-btn'  , 'data-selector'=>'.com-input' ,  'data-route'=> route('cp.commission.store.general') ],'text'=>'ثبت نهایی ' ]) !!}
                    </div>
                </div>


            </div>
        </div>


    </div>


@endsection
