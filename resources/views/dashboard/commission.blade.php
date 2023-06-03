@extends( 'master')

@section('main')


    <div class="uk-container  uk-margin-large-top ">


        <div class="uk-card">
            <div class="uk-card-header"><span class="uk-text-bold">Bank Commissions : </span></div>
            <div class="uk-card-body">
                <table class="uk-table uk-table-divider">

                    <tr>
                        <th>Title</th>
                        <th>Total</th>
                        <th>Current</th>
                    </tr>

                    @foreach($pools_commission as $pc )
                        <tr>
                            <td>{{$pc['title']}} </td>
                            <td>{{$pc['current']}} </td>
                            <td>{{$pc['total']}} </td>
                        </tr>
                    @endforeach

                </table>

            </div>
        </div>


        <hr/>
        <div class="uk-card">
            <div class="uk-card-header"><span class="uk-text-bold">Balance Commissions: </span></div>
            <div class="uk-card-body">
                <table class="uk-table uk-table-divider">
                    <tr>
                        <td width="10%">Total</td>
                        <td class="uk-text-left">{{$balance_commission['total']}} </td>
                    </tr>
                    <tr>
                        <td>Current</td>
                        <td class="uk-text-left">

                            @if($balance['current']['left'] > 0 && $balance['current']['left'] < $balance['current']['right'])
                                {{floor($balance['current']['left']/6)}}
                            @elseif($balance['current']['right'] > 0 && $balance['current']['right'] < $balance['current']['left'])
                                {{floor($balance['current']['right']/6)}}
                            @else
                                0
                            @endif


                        </td>
                    </tr>
                </table>
            </div>
        </div>


        <hr/>

        @php($user_eth = \App\UserEthereumCommission::where('user_id', auth()->id())->first())
        <div class="uk-card">
            <div class="uk-card-header"><span class="uk-text-bold">Genesis Project Investment Balance: </span></div>
            <div class="uk-card-body">
                <table class="uk-table uk-table-divider">
                    <tr>
                        <td width="10%">Total</td>
                        <td class="uk-text-left">{{$user_eth->amount ?? 0}}</td>
                    </tr>
                    <tr>
                        <td>Current</td>
                        <td class="uk-text-left">
                            {{$user_eth->amount ?? 0}}
                        </td>
                    </tr>
                </table>
            </div>
        </div>


        <hr/>

        <div class="uk-card">
            <div class="uk-card-header"><span class="uk-text-bold">Totals:</span></div>
            <div class="uk-card-body">
                <table class="uk-table uk-table-divider">
                    <tr>
                        <td width="20%">Total Commissions</td>
                        @if($user_eth)
                            <td class="uk-text-left">{{Auth::user()->total_commission + number_format($user_eth->amount, 2)}} </td>
                        @else
                            <td class="uk-text-left">{{Auth::user()->total_commission}} </td>
                        @endif
                    </tr>
                    <tr>
                        <td width="20%">Commission Balance</td>
                        <td class="uk-text-left">{{Auth::user()->commission}} </td>
                    </tr>
                    <tr>
                        <td width="20%">Withdraw</td>
                        <td class="uk-text-left">{{$withdraws}} </td>
                    </tr>
                </table>

            </div>
        </div>


        <div class="uk-padding"></div>
    </div>

@endsection
