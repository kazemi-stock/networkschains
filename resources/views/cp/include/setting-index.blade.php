<div class="row">

    <div class="form-group col-md-4">
        <label for="fname" class=" control-label col-form-label mb-2" > نمایش دوره های پر بازدید </label>
        <div >
            {!! select(['خیر' , 'بله'] , ['data-id'=> 'IndexShowItemView' ] , $settings->IndexShowItemView , 0 ) !!}
        </div>
    </div>


    <div class="form-group col-md-4">
        <label for="fname" class=" control-label col-form-label mb-2" > نمایش دوره های جدید </label>
        <div >
            {!! select(['خیر' , 'بله'] , ['data-id'=> 'IndexShowItemNew' ] , $settings->IndexShowItemNew , 0 ) !!}
        </div>
    </div>


    <div class="form-group col-md-4">
        <label for="fname" class=" control-label col-form-label mb-2" > نمایش دوره های پیشنهاد شده </label>
        <div >
            {!! select(['خیر' , 'بله'] , ['data-id'=> 'IndexShowItemSuggest' ] , $settings->IndexShowItemSuggest , 0 ) !!}
        </div>
    </div>


</div>
