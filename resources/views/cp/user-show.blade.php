@extends('cp.master')

@section('header')
    <script type="text/javascript" src="{{asset_url('treeviz/dist/index.js')}}"></script></body>
@endsection

@section('main')
    <style>
        .col-form-label {
            color: #da542e
        }


        .odd-row > .row:nth-child(odd) {
            background-color: #f5f5f5;
        }

        .form-group {
            margin-bottom: 0px;
            padding: 5px;
        }

        .dropdown-menu {
            text-align: right;
            color: black
        }

        #nav-profile label {


            color: #226ad6;
            font-size: 15px;

        }

        #nav-profile .col-md-4 {
            padding: 10px
        }

        /************ ETH-Form ***********/
        .formPopup {
            position: fixed;
            left: 55%;
            top: 25%;
            transform: translate(-70%, 20%);
            border: 3px solid #999999;
            z-index: 9;
        }

        .formContainer {
            max-width: 1000px;
            width: 40rem;
            padding: 20px;
            background-color: #fff;
        }

        .formContainer input[type=text],
        .formContainer input[type=password] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px 0;
            border: none;
            background: #eee;
        }

        .formContainer input[type=text]:focus,
        .formContainer input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

    </style>
    <div class="container-fluid">


        <div class="bd-example tab-wrapper ">
            <div class="nav-wrapper">
                <nav>
                    <div class="nav nav-pills nav-justified " id="nav-tab" role="tablist">
                        <a class=" nav-link active show" data-toggle="tab" href="#nav-home" role="tab"
                           aria-controls="nav-contact" aria-selected="true"> مشخصات اکانت<i
                                    class="mdi  mdi-message-text"></i></a>
                        <a class=" nav-link " data-toggle="tab" href="#nav-pool" role="tab" aria-controls="nav-contact"
                           aria-selected="true"> استخر کاربر<i class="mdi  mdi-message-text"></i></a>
                        <a class=" nav-link " data-toggle="tab" href="#nav-position" role="tab"
                           aria-controls="nav-position" aria-selected="true"> تغییر پوزیشن<i
                                    class="mdi  mdi-message-text"></i></a>
                        <a class=" nav-link " data-toggle="tab" href="#nav-refer" role="tab"
                           aria-controls="nav-position" aria-selected="true"> رفر ها<i
                                    class="mdi  mdi-message-text"></i></a>
                        <button class=" nav-link " type="button" onclick="openForm()"> شارژ کمیسیون اتریوم (Genesis
                            Project)<i class="mdi  mdi-message-text"></i></button>

                    </div>
                </nav>

            </div>
            <div class="tab-content bg-same" id="nav-tabContent">


                @if($userParent)
                    <div class="tab-pane fade" id="nav-position" role="tabpanel" aria-labelledby="nav-position">
                        @include('cp.include.user-position')
                    </div>
                @endif

                <div class="tab-pane fade" id="nav-pool" role="tabpanel" aria-labelledby="nav-pool">
                    @include('cp.include.user-pool')
                </div>
                <div class="tab-pane fade" id="nav-refer" role="tabpanel" aria-labelledby="nav-refer">
                    @include('cp.include.user-refer')
                </div>


                <div class="tab-pane fade active show" id="nav-home" role="tabpanel" aria-labelledby="nav-home">


                    <div class="row">
                        <div class="col-md-12 col-12">

                            <div class="card dark-card ">
                                <div class="card-header">
                                    <a href="#" style="color: white ">
                                        <i class="fa fa-user"></i>
                                        نمودار درختی

                                    </a>
                                </div>
                                <div class="card-body ">

                                    <div id="tree" style="height:300px;width: 650px ; margin: 0 auto"></div>
                                    <script>
                                        var data_1 = JSON.parse('{!! (json_encode($tree)) !!}');


                                        var myTree = Treeviz.create({
                                            htmlId: "tree",
                                            idKey: "id",
                                            hasFlatData: true,
                                            relationnalField: "father",
                                            nodeWidth: 120,
                                            hasPan: true,
                                            hasZoom: false,
                                            nodeHeight: 80,
                                            duration: 3000,
                                            mainAxisNodeSpacing: 2,
                                            isHorizontal: true,
                                            renderNode: function (node) {
                                                return result = "<div class='box' style='cursor:pointer;height:" + node.settings.nodeHeight + "px; width:" + node.settings.nodeWidth + "px;display:flex;flex-direction:column;justify-content:center;align-items:center;background-color:"
                                                    + node.data.color +
                                                    ";border-radius:20px;'><div><strong>"
                                                    + node.data.text_1 +
                                                    "</strong></div></div>";
                                            },
                                            linkWidth: (nodeData) => 5,
                                            linkShape: "quadraticBeziers",
                                            linkColor: (nodeData) => nodeData.linkColor || "#B0BEC5",
                                            onNodeClick: (nodeData) => console.log(nodeData)
                                        });
                                        myTree.refresh(data_1);

                                    </script>


                                </div>
                            </div>
                            <div class="card dark-card ">
                                <div class="card-header">
                                    <a href="#" onclick="$('#user-info').toggle()" style="color: white ">
                                        <i class="fa fa-user"></i>
                                        مشخصات کاربر

                                    </a>
                                </div>
                                <div class="card-body " id="user-info" style="display: none">

                                    <div class="row">
                                        <div class="col-6">

                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">نام</label>
                                                <div class="col-sm-9">
                                                    {{$user->name}}
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">ایمیل</label>
                                                <div class="col-sm-9">
                                                    {{$user->email}}
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">کد
                                                    عضویت</label>
                                                <div class="col-sm-9">
                                                    {{$user->token}}
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">آدرس
                                                    والت تتر</label>
                                                <div class="col-sm-9">
                                                    {{$user->wallet_address ? $user->wallet_address : 'ثبت نشده'}}
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">آدرس
                                                    والت اتریوم</label>
                                                <div class="col-sm-9">
                                                    {{$user->wallet_address ? $user->wallet_ethAddress : 'ثبت نشده'}}
                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-6">

                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">موجودی
                                                    اعتبار</label>
                                                <div class="col-sm-9">
                                                    {{price($user->credit)}}
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">موجودی
                                                    امتیاز</label>
                                                <div class="col-sm-9">
                                                    {{($user->point)}}
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">کل
                                                    امتیازات کسب شده</label>
                                                <div class="col-sm-9">
                                                    {{($user->total_point)}}
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">تعداد
                                                    سهام</label>
                                                <div class="col-sm-9">
                                                    {{($user->stock)}}
                                                </div>
                                            </div>
                                            @php($eth = \App\UserEthereumCommission::where('user_id', $user->id)->first())
                                            <div class="form-group row">
                                                <label for="fname"
                                                       class="col-sm-3 text-right control-label col-form-label ">کمیسیون
                                                    سهام اتریوم</label>
                                                <div class="col-sm-9" id="eth-value">
                                                    {{ $eth->amount ?? 0 }}
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-12 col-md-12">

                            <div class="card dark-card">
                                <div class="border-bottom"> کمیسون های دریافت شده


                                    <span class="btn btn-secondary float-left">commission : {{$user->commission}}</span>
                                    <span class="btn btn-success float-left ml-1">total commission : {{$user->total_commission}}</span>
                                    <span class="btn btn-danger float-left ml-1"> {{$user->CurrentPool ? $user->CurrentPool->Pool->title : '-'}}</span>
                                    <span class="btn btn-warning float-left ml-1" style="color: black !important;"> saved balance left : {{$balance_leftover ? $balance_leftover->left_direction :0}}</span>
                                    <span class="btn btn-warning float-left ml-1" style="color: black !important;"> saved balance right  : {{$balance_leftover ? $balance_leftover->right_direction : 0}}</span>

                                </div>
                                <div class="card-body">

                                    <table class="table table-striped">
                                        <tr>
                                            <th>تاریخ</th>
                                            <th>امتیاز استخر</th>
                                            <th>امتیاز تعادل</th>
                                            <th>لیمیت</th>
                                            <th>جمع کل</th>
                                            <th>استخر</th>
                                        </tr>
                                        @foreach($commissions as $commission )
                                            <tr>
                                                <td>{{jdate($commission->created_at)}}</td>
                                                <td>
                                                    <a href="{{route('cp.commission.show' , ['id'=>$commission->commission_init_id])}}"
                                                       class="btn btn-info">{{$commission->pool_amount}}</a></td>
                                                <td><a href="#"
                                                       data-route="{{route('cp.user.commission.balance.log' , ['com_id'=>$commission->commission_init_id ,'user_id'=>$user->id ])}}"
                                                       class="btn btn-secondary com-balance-log-btn">


                                                        <span class="spiner">...</span>
                                                        <span class="nospiner">{{$commission->balance_amount}}</span>


                                                    </a></td>
                                                <td>{{$commission->point_limit}}</td>
                                                <td>{{$commission->amount}}</td>
                                                <td>{{$commission->UserPool->Pool->title}}</td>
                                            </tr>

                                        @endforeach
                                    </table>
                                    {{$commissions->links()}}

                                </div>
                            </div>

                        </div>

                    </div>


                </div>


            </div>
        </div>


    </div>

    <div class="formPopup row" id="eth-Form" style="display: none">
        <form action="{{ route('cp.commission.ethereum.balance') }}" onsubmit="formStore(event)" method="post"
              id="form-action"
              class="formContainer pt-1">
            @csrf
            <input type="hidden" name="id" id="id" value="{{ $user->id }}">
            <h4 class="text-left">Genesis Project Investment Balance Charge</h4>
            <hr>
            <label for="amount" class="text-right d-block">
                <strong>: شارژ کمیسیون اتریوم</strong>
                <input type="text" id="amount" placeholder="مقدار کمسیون کاربر را (فقط به عدد) وارد کنید..." name="amount"
                       class="form-control border bg-white" value="{{ $eth->amount ?? 0 }}" required>
            </label>
            <div class="text-left">
                <button type="submit" class="btn btn-info px-4">ثبت</button>
                <button type="button" class="btn btn-danger px-4" onclick="closeForm()">لغو</button>
            </div>
        </form>
    </div>

    <script>
        $(document).on('click', '.com-balance-log-btn', function () {

            let btn = $(this);
            loadspiner(btn);
            $.post(btn.data('route'), csrf({}), function (data) {

                data = $.parseJSON(data);
                unloadspiner(btn);
                if (data.stat == 'ok') {
                    $('#master-modal').find('.modal-body').html(data.html);
                    $('#master-modal').modal('show');
                } else {
                    er('موردی یافت نشد');
                }
            });


        })
    </script>
    <script>
        function openForm() {
            document.getElementById("eth-Form").style.display = "block";
        }

        // ETH-Form Store
        function formStore(e) {
            e.preventDefault();
            var formData = new FormData(document.getElementById('form-action'));
            $.ajax({
                url: $('#form-action').attr('action'),
                type: 'POST',
                data: formData,
                success: function (data) {
                    var val = document.getElementById('eth-value')
                    val.innerHTML = null
                    val.innerHTML = data
                    Swal.fire({
                        text: 'مقدار کمیسیون اتریوم کاربر با موفقیت شارژ شد.',
                        type: 'success',
                        icon: 'success',
                        showCancelButton: false,
                        confirmButtonText: 'باشه',
                    });
                    document.getElementById("eth-Form").style.display = "none";
                },
                error: function (err) {
                    console.log(err)
                    Swal.fire({
                        text: 'متاسفانه خطائی رخ داده است.',
                        type: 'error',
                        icon: 'error',
                        showCancelButton: false,
                        confirmButtonText: 'باشه',
                    });
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-TOKEN", $('meta[name="csrf-token"]').attr('content'));
                },

                cache: false,
                contentType: false,
                processData: false
            });
        }

        function closeForm() {
            document.getElementById('eth-Form').style.display = 'none'
        }
    </script>
@endsection
