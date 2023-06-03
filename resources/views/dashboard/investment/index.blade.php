@extends( 'master')
@section('styles')
    <style>
        .bg {
            background-color: black;
            background-image: url('{{ asset_url('img/ISB/bg04.jpg') }}');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            background-clip: border-box;
            /*filter: grayscale(0.7);*/
            /*filter: blur(5px);*/
            /*filter: contrast(200%);*/
            filter: grayscale(40%);
            filter: hue-rotate(50deg);
            filter: drop-shadow(0px 0px 100px #2f82ff);
        }

        .bg-menu {
            background-image: url('{{ asset_url("img/bg_1.jpg") }}');
            background-attachment: fixed;
            filter: grayscale(0.7);
            /*filter: blur(5px);*/
            filter: contrast(200%);
            filter: grayscale(80%);
            filter: hue-rotate(20deg);
            filter: drop-shadow(0px 0px 10px #00041d);
        }
    </style>
@endsection
@section('main')


    <div class="uk-container  uk-container-expand bg-menu">
        <div class="uk-padding-large">
            <div class="uk-card uk-card-default uk-text-white bg">
                <div class="uk-card-header uk-text-bold"><span uk-icon="icon:  credit-card"></span>
                    ISB Investment :
                    <br>

                </div>
                <div class="uk-card-body">
                    <br/>
                    The ISB invests in valuing the token, and the proceeds are for art, theater and cinema programs.
                    The plan of this investment is that you charge your account to OUCC (which is equivalent to Tether
                    and TRC20 network), and then convert the amount you want to invest in this plan into ISB. After
                    conversion and approval of the account by the company's operators, this plan will be activated for
                    you and the investment profit will be credited to your account instantly.
                    <br>
                    <b>Profit calculation:</b>
                    <br>
                    Profit rate is 0.01 percent per hour, which is 0.24 percent in 24 hours.
                    <br>
                    <b>Deposit and withdrawal:</b>
                    <br>
                    You can deposit or withdraw whenever you want.
                    After depositing and starting the plan, you can re-deposit, and after confirmation, the profit will
                    be added to your account.
                    <br>
                    <b>Note:</b> The minimum deposit or withdrawal amount is 10 OUCC.
                    <br>
                    <b>Fees:</b>
                    <br>
                    11% and 6 OUCC will be deducted from the total withdrawal amount as a commission for each
                    withdrawal.
                    Of course, all this amount was for network costs and token transfer fees.
                    <hr>
                    <div uk-grid>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                Invest amount :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block">
                                        <span class="uk-form-icon"><i class="fas fa-sticky-note icon-medium"></i></span>
                                        <form action="{{ route('dashboard.invest.deposit.convert') }}" method="post" id="invest-form">
                                            @csrf
                                        <input class=" uk-input uk-form-small" name="amount" type="text"
                                               placeholder="Enter OUCC to Convert and Invest..." required>
                                        </form>
                                        @if(session('error'))
                                            <div class="uk-text-danger">{{ session('error') }}</div>
                                        @elseif(session('success'))
                                            <div class="uk-text-success">{{ session('success') }}</div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-medium-bottom">
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    your OUCC : {{ $amount->oucc_amount ?? '0.0000' }}
                                    <br>
                                    your ISB : {{ $amount->isb_amount ?? '0.0000' }}
                                </div>
                                <hr>
                                <div class="uk-display-inline-block" id="profit">Your Profit
                                    : 0.00000000</div>
                                <a href="#"
                                   class="uk-display-inline-block uk-float-right uk-button uk-button-small uk-button-white">Withdrawal</a>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div>
                        <a href="{{ route('dashboard.invest.deposit') }}"
                           class="uk-button uk-button-white">Deposit</a>
                        <button type="submit" form="invest-form" class="uk-button uk-button-white">Convert</button>
                    </div>
                </div>
            </div>
        </div>
        <hr/>
        <div class="uk-padding-large uk-padding-remove-top">
            <div class="uk-card">
                <div class="uk-card-header">Deposit History</div>
                <div class="uk-card-body">
                    <table class="uk-table uk-table-divider uk-responsive-width uk-table-responsive  uk-table-small uk-table-striped uk-table-hover">
                        <thead>
                        <tr>
                            <th>Amount</th>
                            <th>Hash</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($deposits as $deposit )
                            <tr>
                                <td>{{$deposit->amount}}</td>
                                <td>{{$deposit->hash}}</td>
                                <td>{{$deposit->created_at}}</td>
                                @if($deposit->confirm == 0)
                                    <td class="uk-text-warning">Waiting</td>
                                @elseif($deposit->confirm == 1)
                                    <td class="uk-text-danger">Not approved</td>
                                @else
                                    <td class="uk-text-success">Confirmed</td>
                                @endif
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
        setInterval(function(){
            $.ajax({
                url: 'get/profit',
                type: 'POST',
                success: function (data) {
                    $('#profit').html('Your Profit : '+ data)
                },
                error: function (err) {
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-TOKEN", $('meta[name="csrf-token"]').attr('content'));
                },
                complete: function () {
                },

                cache: false,
                contentType: false,
                processData: false
            });
        }, 2000);
    </script>
@endsection
