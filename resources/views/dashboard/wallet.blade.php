@extends( 'master')

@section('main')


    <div class="uk-container  uk-container-large uk-margin-large-top">
        <div class="uk-padding-large">
            <div class="uk-card uk-card-default">
                <div class="uk-card-header uk-text-bold" >
                    <h4>your wallet's address</h4>
                </div>
                <div class="uk-card-body">
                    <br />

                    <div uk-grid>
                        <div class="uk-width-1-1@m uk-width-1-1@s">
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block" >
                                        <label for="address">
                                            <strong>your Tether USD (TRC20) wallet address:</strong>
                                        <span class="uk-form-icon"><i class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large wallet-input"  data-id="address"  type="text" placeholder="" value="{{Auth::user()->wallet_address}}" >
                                        </label>
                                        <label for="ethAddress">
                                            <strong>your Ethereum (ETH) wallet address:</strong>
                                        <span class="uk-form-icon"><i class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large wallet-input"  data-id="ethAddress"  type="text" placeholder="" value="{{Auth::user()->wallet_ethAddress}}" >
                                        </label>
                                    </div>


                                </div>
                            </div>

                        </div>
                    </div>
                    <hr />
                    <div>
                        {!! button( ['attr'=> [ 'class' => 'uk-button uk-button-secondary store-btn'  , 'data-selector'=>'.wallet-input' ,  'data-route'=> route('dashboard.wallet.store') ],'text'=>'Save  ' ]) !!}
                    </div>
                </div>
            </div>
        </div>






    </div>

@endsection
