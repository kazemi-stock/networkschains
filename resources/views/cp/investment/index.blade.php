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
                            <th> مقدار OUCC </th>
                            <th> مقدار ISB </th>
                            <th> سود </th>
                        </tr>
                        </thead>
                        <tbody>
                        @php($i=1)
                        @foreach($users as $user  )
                            @php($isb_user = \App\User::find($user->user_id))
                            <tr  class="item-row">
                                <td width="50">{{ $i }}</td>
                                <td>{{ $isb_user->name }}</td>
                                <td>{{ $isb_user->email }}</td>
                                <td>{{ $user->oucc_amount }}</td>
                                <td>{{ $user->isb_amount }}</td>
                                <td>{{ $user->profit }}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>

                    {{$users->links()}}
            </div>
        </div>


    </div>


@endsection
