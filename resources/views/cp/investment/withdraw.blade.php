@extends('cp.master')
@section('styles')
    <style>
        .formPopup01 {
            display: none;
            position: fixed;
            left: 50%;
            top: 15%;
            transform: translate(-50%, 5%);
            border: 3px solid #999999;
            z-index: 9;
        }

        .formContainer01 {
            max-width: 20rem;
            width: 20rem;
            padding: 10px;
            background-color: #fff;
        }
    </style>
@endsection
@section('main')
    <div class="container-fluid">

        <div class="card">
            <div class="border-bottom">
                <div class="row">
                    <div class="col-md-10" style="text-align:right ; direction:rtl">

                    </div>


                </div>

            </div>
            <div class="card-body">
                <table class="table table-borderless  table-striped ">
                    <thead>
                    <tr>
                        <th width="50"> ردیف</th>
                        <th>نام</th>
                        <th>ایمیل</th>
                        <th style="max-width: 150px!important;">کیف پول</th>
                        <th style="max-width: 80px!important;"> مقدار برداشت</th>
                        <th style="max-width: 150px!important;">هش کد</th>
                        <th>وضعیت</th>
                        <th> عملیات</th>
                    </tr>
                    </thead>
                    <tbody>
                    @php($i=1)
                    @foreach($users as $user  )
                        @php($isb_user = \App\User::find($user->user_id))
                        @if(session('error'))
                            <div class="alert alert-danger">{{ session('error') }}</div>
                        @elseif(session('success'))
                            <div class="alert alert-success">{{ session('success') }}</div>
                        @endif
                        <tr class="item-row">
                            <td width="50">{{ $i }}</td>
                            <td>{{ $isb_user->name ?? '' }}</td>
                            <td>{{ $isb_user->email ?? '' }}</td>
                            <td style="max-width: 150px!important;">{{ $user->wallet ?? '' }}</td>
                            <td style="max-width: 80px!important;">{{ $user->amount ?? '' }}</td>
                            <td style="max-width: 110px!important;">{{ $user->hash ?? '' }}</td>
                            @if($user->confirm == 0)
                                <td class="text-warning">در انتظار</td>
                            @elseif($user->confirm == 1)
                                <td class="text-danger">رد شد</td>
                            @else
                                <td class="text-success">تائید شد</td>
                            @endif
                            <td>
                                <form action="{{ route('cp.invest.withdraw.approve') }}" class="m-1 d-inline-block"
                                      method="post">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $user->id }}">
                                    <button type="submit" onclick="return confirm('آیا از رد کردن برداشت مطمئن هستید؟')"
                                            class="btn btn-danger">رد کردن
                                    </button>
                                </form>
                                <form action="{{ route('cp.invest.withdraw.confirm') }}" class="m-1 d-inline-block"
                                      method="post">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $user->id }}">
                                    <button type="submit" onclick="return confirm('آیا از تائید برداشت مطمئن هستید؟')"
                                            class="btn btn-success px-4">تائید
                                    </button>
                                </form>
                                <button type="button" onclick="showHashForm({{ $user }})"
                                        class="btn btn-primary">ثبت هش
                                </button>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>

                {{$users->links()}}
            </div>
        </div>


    </div>
    <div class="formPopup01" id="hashForm" style="display: none">
        <form id="hash-form" action="{{ route('cp.invest.withdraw.hash') }}"
              method="post" class="formContainer01">
            @csrf
            <input type="hidden" name="id" id="id">
            <h4 class="font-titr font-weight-bolder mt-0">ثبت هش کد واریز</h4>
            <hr>
            <label for="unitName" class="text-right">
                <strong>هش کد:</strong>
                <input type="text" class="mb-3 form-control" placeholder="هش کد را وارد کنید..."
                       name="hash" required>
            </label>
            <div>
                <button type="submit" class="btn btn-success">ثبت</button>
                <button type="button" class="btn btn-danger" onclick="$('#hashForm').css('display', 'none')">لغو
                </button>
            </div>
        </form>
    </div>
    <script>
        function showHashForm(data) {
            $('#id').val(data.id)
            $('#hashForm').css('display', 'block')
        }
    </script>
@endsection
