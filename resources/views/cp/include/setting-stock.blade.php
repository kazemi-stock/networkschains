
<div class="card ">
    <div class="card-header"> خرید اعتبار </div>
    <div class="card-body">
        <div class="row">
            <div class="form-group col-md-4">
                <label for="fname" class="col-sm-12 text-right control-label col-form-label " >    قیمت یک دلار - {{currency('ir')}}  </label>
                <div class="col-sm-12">
                    <input type="text" class="form-control numeric"  data-id="creditUsdPrice" value="{{number_format($settings->creditUsdPrice)}}">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="card ">
    <div class="card-header">  درخواست همکاری </div>
    <div class="card-body">
        <div class="row">
            <div class="form-group col-md-4">
                <label for="fname" class="col-sm-12text-right control-label col-form-label " >   حداقل امتیاز مورد نیاز برای درخواست همکاری </label>
                <div class="col-sm-12">
                    <input type="text" class="form-control"  data-id="PartnershipPointReq" value="{{($settings->PartnershipPointReq)}}">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="card ">
    <div class="card-header"> خرید امتیاز</div>
    <div class="card-body">
        <div class="row">
            <div class="form-group col-md-4">
                <label for="fname" class="col-sm-12text-right control-label col-form-label " >    قیمت هر امتیاز - {{currency()}}  </label>
                <div class="col-sm-12">
                    <input type="text" class="form-control numeric"  data-id="PointPrice" value="{{number_format($settings->PointPrice)}}">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card ">
    <div class="card-header"> خرید اوراق سهام</div>
    <div class="card-body">


        <div class="row">
            <div class="form-group col-md-4">
                <label for="fname" class="col-sm-12text-right control-label col-form-label " >  حداقل خرید - {{currency()}}</label>
                <div class="col-sm-12">
                    <input type="text" class="form-control numeric"  data-id="minStockAllowed" value="{{number_format($settings->minStockAllowed)}}">
                </div>
            </div>
            <div class="form-group col-md-4">
                <label for="fname" class="col-sm-12text-right control-label col-form-label " >   حداکثر خرید - {{currency()}}</label>
                <div class="col-sm-12">
                    <input type="text" class="form-control numeric"  data-id="maxStockAllowed" value="{{number_format($settings->maxStockAllowed)}}">
                </div>
            </div>
            <div class="form-group col-md-4">
                <label for="fname" class="col-sm-12text-right control-label col-form-label " >    قیمت هر واحد - {{currency()}} </label>
                <div class="col-sm-12">
                    <input type="text" class="form-control numeric"  data-id="StockUnitPrice" value="{{number_format($settings->StockUnitPrice)}}">
                </div>
            </div>
        </div>



    </div>

</div>
