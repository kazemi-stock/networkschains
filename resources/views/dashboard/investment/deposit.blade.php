@extends( 'master')
@section('styles')
    <style>
        .bg {
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
            <div class="uk-card uk-card-default">
                <div class="uk-text-center">
                    <div class="uk-display-block">
                        <img src="{{ asset_url('img/ISB/qr_code.png') }}" align="center"
                             alt="QR Code">
                    </div>
                    <div class="uk-border-pill uk-display-inline-block uk-padding-small uk-text-white" style="border: 1px solid gray;background-color: black">
                        <input class="uk-display-inline-block uk-text-white" id="wallet" value="TNviK21uw7dPk7nQWLsqdaLX9aun1FA6mi"
                               style="width: 250px; background-color: black; border: none" readonly>
                        <a href="#" onclick="copyInClipboard()" title="Copy to Clipboard"
                           class="uk-text-white"><span uk-icon="icon:  copy"></span></a>
                    </div>
                </div>
                <div class="uk-card-header uk-text-bold"><span uk-icon="icon:  credit-card"></span>
                    Deposit to invest ISB :
                    <br>

                </div>
                <div class="uk-card-body">

                    <hr>
                    <form action="{{ route('dashboard.invest.deposit.store') }}" id="deposit-form" method="post"
                          uk-grid>
                        @csrf
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                Amount : <span class="uk-text-danger">Tether ( TRC20 )</span>
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block">
                                            <span class="uk-form-icon"><i
                                                        class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large" name="amount"
                                               type="text" placeholder="Enter the amount you transferred..." required>
                                    </div>


                                </div>
                            </div>

                        </div>
                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <div class="uk-margin-small">
                                Hash Code:
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block">
                                            <span class="uk-form-icon"><i
                                                        class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large" name="hash"
                                               type="text" placeholder="Your transfer hash code..." required>
                                        @if(session('error'))
                                            <div class="uk-text-danger">{{ session('error') }}</div>
                                        @endif
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                    <hr/>
                    <div>
                        <button type="submit" form="deposit-form" class="uk-button uk-button-white">Deposit</button>
                    </div>
                </div>
            </div>
        </div>

        <hr/>
    </div>
    <script>
        function copyInClipboard() {
            var copyTextarea = document.getElementById("wallet");
            copyTextarea.select(); //select the text area
            document.execCommand("copy"); //copy to clipboard
            alert("Copied the text: " + copyTextarea.value);
        }
    </script>
@endsection
