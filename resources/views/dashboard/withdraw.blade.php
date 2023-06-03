@extends('master')

@section('main')


    <div class="uk-container">


        <div class="uk-padding-large">
            <div class="uk-card uk-card-default">
                <div class="uk-card-header uk-text-bold" ><span uk-icon="icon:  credit-card"></span>
                    Withdraw
                </div>
                <div class="uk-card-body">
                    <br />

                    <div uk-grid>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                Current Commission :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                     {{Auth::user()->commission}}
                                </div>
                            </div>

                        </div>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                Available Commission :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    {{intval(Auth::user()->commission - (Auth::user()->commission%10))}}
                                </div>
                            </div>

                        </div>
                    </div>
                    <hr />
                    <div>
                        {!! button( ['attr'=> [ 'class' => 'uk-button uk-button-primary store-btn uk-width-1-1'  , 'data-selector'=>'.withdraw-input' ,  'data-route'=> route('dashboard.withdraw.store') ],'text'=>'Submit Withdraw Request ' ]) !!}


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
                            <th>Date</th>
                            <th width="30%">Status</th>
                        </tr>
                        @foreach($withdraws as $withdraw )
                            <tr>
                                <td>{{$withdraw->amount}}</td>
                                <td>{{$withdraw->created_at}}</td>
                                <td>

                                    @if(!$withdraw->Success)

                                        <div class="uk-alert-warning" uk-alert>
                                            <p>pending</p>
                                        </div>
                                    @else
                                        <div class="uk-alert-success" uk-alert>
                                           done
                                        </div>

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
