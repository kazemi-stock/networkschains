@extends('master')
@section('main')
    <div class="uk-container">
        <div class="uk-padding-large">
            <div class="uk-card uk-card-default">
                <div class="uk-card-body">
                    <div uk-grid>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                Referal Code :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <input class="uk-input uk-form-large position-input" type="text" data-id="ref_code">
                                </div>
                            </div>
                        </div>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                Position Code :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <input class="uk-input uk-form-large position-input" type="text"
                                           data-id="position_code">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div>
                        {!! button( ['attr'=> [ 'class' => 'uk-button uk-button-primary store-btn uk-width-1-1'  , 'data-selector'=>'.position-input' ,  'data-route'=> route('dashboard.position.store') ],'text'=>'Save ' ]) !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
