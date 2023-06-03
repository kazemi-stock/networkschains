<div style="padding-top: 56px">
    <button class="uk-width-1-1 uk-button uk-button-default uk-text-bold" id="present-to-filter-toggle" style="border-left: none ; border-right: none">
        بازگشت <i class="fas fa-arrow-right uk-margin-left"></i>
    </button>
</div>

<div class="uk-padding-small">
    <div class="uk-card uk-card-default">
        <div class="uk-card-header uk-padding-small">

            <div class="uk-grid-small uk-flex-middle" uk-grid>
                <div class="uk-width-expand rtl">
                    <h3 class="uk-card-title uk-margin-remove-bottom">{{$lads->title}}</h3>
                    <p class="uk-text-meta uk-margin-remove" style="padding: 2px 0px"> <time datetime="2016-04-01T19:00" class="fs12">{{jdate($lads->created_at , 'l Y/m')}}</time></p>
                    <p class="uk-text-meta uk-margin-remove fs13 color-black" style="padding: 2px 0px"> <i class="fas fa-handshake uk-margin-small-left color-blue"></i> {{deal_type($lads->deal_type)}} /  {{$lads->metraj}} متر    </p>
                    <p class="uk-text-meta uk-margin-remove fs13  color-black" style="padding: 2px 0px">
                        <i class="fas fa-dollar-sign uk-margin-small-left color-blue"></i>

                        @if($lads->deal_type == 'sell')
                          {{price($lads->price_sell , true )}}
                        @elseif($lads->deal_type == 'rent')
                            رهن :  {{price($lads->price_rahn , true )}} /  اجاره {{price($lads->price_rent , true )}}
                        @endif



                    </p>
                    <p class="uk-text-meta uk-margin-remove fs13  color-black" style="padding: 2px 0px">  <i class="fas fa-phone uk-margin-small-left color-blue"></i> {{$lads->phone}} </p>
                </div>
                <div class="uk-width-auto">
                    <img class="uk-border-circle" style="width: 80px ; height: 80px " src="{{upload_url($lads->image)}}">
                </div>
            </div>
        </div>
        <div class="uk-card-body">
            <p>{{$lads->text}}</p>
        </div>
        <div class="uk-card-footer uk-padding-small uk-text-center">
{{--            <a href="#" class="uk-button uk-button-danger uk-button-xs fs12">نشان کردن</a>--}}
{{--            <a href="#" class="uk-button uk-button-danger uk-button-xs fs12">بازدید حضوری</a>--}}
            <a href="#" class="uk-button uk-button-danger uk-button-xs fs12" onclick="fly_to_point(  {{$lads->lat}} , {{$lads->lng}} );">نمایش روی نقشه</a>
        </div>
    </div>


    <ul class="uk-list uk-list-divider rtl uk-text-black fs17">
        @foreach($lads->AdCategoryAttribute as $aattr)

            @if($aattr->Attribute->type =='check')
                 <li> <input type="checkbox" class="uk-checkbox"  readonly style="background-color: green ; color: white   " checked> {{$aattr->Attribute->title }} </li>
            @else
                 <li> {{$aattr->Attribute->title }} : {{$aattr->val}} </li>
            @endif

        @endforeach
    </ul>

</div>
