@extends( 'master')

@section('main')


    <div class="uk-container  uk-container-large uk-margin-large-top">








        <div class="uk-padding-large">
            <div class="uk-card uk-card-default">
                <div class="uk-card-header uk-text-bold" ><span uk-icon="icon:  credit-card"></span>
                    current credit :
                    <span uk-tooltip="Online University Credit Coin"> {{price(Auth::user()->credit)}}</span>


                </div>
                <div class="uk-card-body">
                    <br />

                    <div uk-grid>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                Amount :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block" >
                                        <span class="uk-form-icon"><i class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large point-input"  data-id="amount"  type="text" placeholder="points" >
                                    </div>


                                </div>
                            </div>

                        </div>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                .
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    point/{{currency()}} :  {{(setting($global_setting , 'PointPrice' , 0 ))}}.00
                                </div>
                            </div>

                        </div>
                    </div>
                    <hr />
                    <div>
                        {!! button( ['attr'=> [ 'class' => 'uk-button uk-button-secondary store-btn reload'  , 'data-selector'=>'.point-input' ,  'data-route'=> route('dashboard.wallet.point.buy') ],'text'=>'convert credit to points ' ]) !!}
                    </div>
                </div>
            </div>
        </div>

        <hr />


        <div class="uk-padding-large uk-padding-remove-top">
            <div class="uk-card">
                <div class="uk-card-header">Convert History</div>
                <div class="uk-card-body">
                    <table class="uk-table uk-table-divider">
                        <tr>
                            <th>Point</th>
                            <th >Price</th>
                            <th>Date</th>
                        </tr>
                        @foreach($points as $point )
                            <tr>
                                <td>{{$point->amount}}</td>
                                <td>{{price($point->Invoice->price)}}</td>
                                <td>{{$point->created_at}}</td>

                            </tr>
                        @endforeach
                    </table>
                </div>
            </div>
        </div>


    </div>

@endsection
