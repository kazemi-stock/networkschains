@extends('master')

@section('main')


    <div class="uk-container">


        <div class="uk-padding-large">
            <div class="uk-card uk-card-default">
                <div class="uk-card-header"><img class="uk-display-block uk-button uk-align-center" src="http://networkschains.com/assets/img/wallet/qr-code.png" alt="QR-Barcode" style=" border: 1px solid gray; padding: 20px">
{{--                    <h5 class="uk-display-inline-block"> Web Site USDT  <u class="uuk-text-bolder uk-text-warning">(TRC20)</u> Wallet :--}}
{{--                        <h5 class="uk-button uk-text-white uk-card-header-bg" style="background: black; border-radius: 5px; margin-left: 30px ;  ">TDTAzPqUfs7Lc2oVyraSFHYwTUFVxuaeYh</h5>--}}
{{--                    </h5>--}}
{{--                    --}}
                    <div uk-grid>
                        <div class="uk-width-auto@m uk-text-bold"><span uk-icon="icon:  credit-card"  class="uk-margin-small-right"> </span>Web Site USDT  <u class="uuk-text-bolder uk-text-warning">(TRC20)</u> Wallet :</div>
                        <div class="uk-width-expand@m uk-text-left">
                            <div class="uk-hidden@m  uk-padding-small uk-text-white"  style="word-wrap: break-word;background: black; border-radius: 5px;">TDTAzPqUfs7Lc2oVyraSFHYwTUFVxuaeYh</div>
                            <span class="uk-visible@m uk-padding-small uk-text-white"  style="word-wrap: break-word;background: black; border-radius: 5px;">TDTAzPqUfs7Lc2oVyraSFHYwTUFVxuaeYh</span>

                        </div>
                    </div>

                    <hr />

                    <h5 class="uk-text-white uk-button uk-button-danger uk-text-left">


                        Please ensure that the deposit and withdrawal are on the same network, otherwise, the withdrawal will fail. The different impacts of the network are rates, minimum withdrawal amount, and transfer time

                    </h5>
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
                                    <input class="uk-input uk-form-large wallet-input" type="text" data-id="amount">
                                </div>
                            </div>

                        </div>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                Hash (txid) :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <input class="uk-input uk-form-large wallet-input" type="text" data-id="tag">
                                </div>
                            </div>

                        </div>
                    </div>
                    <hr />
                    <div>
                        {!! button( ['attr'=> [ 'class' => 'uk-button uk-button-primary store-btn uk-width-1-1'  , 'data-selector'=>'.wallet-input' ,  'data-route'=> route('dashboard.deposit.store') ],'text'=>'Submit Payment ' ]) !!}


                    </div>

                </div>
            </div>
        </div>

        <div class="uk-padding-large uk-padding-remove-top">
        <div class="uk-card">
            <div class="uk-card-header">Payment History</div>
            <div class="uk-card-body">
                <table class="uk-table uk-table-divider">
                    <tr>
                        <th>Amount</th>
                        <th>Tag</th>
                        <th>Date</th>
                        <th width="30%">Status</th>
                    </tr>
                    @foreach($payments as $payment )
                        <tr>
                            <td>{{$payment->amount}}</td>
                            <td>{{$payment->tag}}</td>
                            <td>{{$payment->created_at}}</td>
                            <td>

                                @if(!$payment->Response)

                                <div class="uk-alert-warning" uk-alert>
                                    <p>waiting</p>
                                </div>
                                @else
                                    @if($payment->Response->status == 'accept')
                                        <div class="uk-alert-success" uk-alert>
                                           Accepted  @if($payment->Response->text) : {{$payment->Response->text}} @endif
                                        </div>
                                    @else
                                        <div class="uk-alert-danger" uk-alert>
                                            Deny @if($payment->Response->text) : {{$payment->Response->text}} @endif
                                        </div>
                                    @endif

                                @endif


                            </td>

                        </tr>
                    @endforeach
                </table>
            </div>
        </div>
        </div>
    </div>

@endsection
