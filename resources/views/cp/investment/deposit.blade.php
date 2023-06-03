@extends('cp.master')

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
                        <th width="50"> ردیف </th>
                        <th>نام </th>
                        <th>ایمیل </th>
                        <th> مقدار واریز </th>
                        <th style="max-width: 100px!important;">هش کد </th>
                        <th>وضعیت </th>
                        <th> عملیات </th>
                    </tr>
                    </thead>
                    <tbody>
                    @php($i=1)
                    @foreach($users as $user  )
                        @php($isb_user = \App\User::find($user->user_id))
                        <tr  class="item-row">
                            <td width="50">{{ $i }}</td>
                            <td>{{ $isb_user->name ?? '' }}</td>
                            <td>{{ $isb_user->email ?? '' }}</td>
                            <td>{{ $user->amount ?? '' }}</td>
                            <td style="max-width: 100px!important;">{{ $user->hash ?? '' }}</td>
                            @if($user->confirm == 0)
                                <td class="text-warning">در انتظار</td>
                            @elseif($user->confirm == 1)
                                <td class="text-danger">رد شد</td>
                            @else
                                <td class="text-success">تائید شد</td>
                            @endif
                            <td>
                                <form action="{{ route('cp.invest.deposit.approve') }}" class="m-1 d-inline-block" method="post">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $user->id }}">
                                    <button type="submit" onclick="return confirm('آیا از رد کردن واریز مطمئن هستید؟')" class="btn btn-danger">رد کردن</button>
                                </form>
                                <form action="{{ route('cp.invest.deposit.confirm') }}" class="m-1 d-inline-block" method="post">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $user->id }}">
                                    <button type="submit" onclick="return confirm('آیا از تائید واریز مطمئن هستید؟')" class="btn btn-success px-4">تائید</button>
                                </form>

                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>

                {{$users->links()}}
            </div>
        </div>


    </div>


@endsection
