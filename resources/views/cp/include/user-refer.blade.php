
<div class="card dark-card">
    <div class="card-header">رفر ها</div>
    <div class="card-body">
        <table class="table table-striped">
            <tr>
                <th>کاربر</th>
                <th>تاریخ</th>
            </tr>
            @foreach($referals as $referal )
                <tr>
                    <td> <a href="{{route('cp_user_show' , ['id'=>$referal->id])}}"> {{$referal->Alias()}}</a></td>
                    <td>{{jdate($referal->created_at)}}</td>
                </tr>

            @endforeach
        </table>


    </div>
</div>
