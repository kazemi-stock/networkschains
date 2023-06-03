@if(isset($log->logs))
<div class="card dark-card">
    <div class="card-header"> داده ها</div>
    <div class="card-body">
        <ul>
            @foreach($log->logs as $log_info)
            <li>{{$log_info}}</li>
            @endforeach
        </ul>
    </div>
</div>
@endif

<div class="row">
    <div class="col-6">

        <div class="card dark-card">
            <div class="card-header">سمت چپ</div>
            <div class="card-body">
                <ul>
                    <li>کاربر ها : {{$log->left->users}}</li>
                    <li>امتیاز کاربر ها : {{$log->left->points}}</li>

                    @if(isset($log->left->left_over))
                    <li>زخیره ماه قبل : {{$log->left->left_over}}</li>
                    @endif

                    @if(isset($log->left->total_point))
                    <li>جمع امتیاز : {{$log->left->total_point}}</li>
                    @endif


                    @if(isset($log->left->total_point))

                        @if($log->left->total_point < $log->right->total_point)
                            <li>ذخیره دور بعد : {{$log->for_next_round_balance_direction}}</li>
                        @else
                            <li>ذخیره دور بعد : {{$log->for_nex_month_save_direction}}</li>
                        @endif


                    @else


                        @if($log->left->points < $log->right->points)
                            <li>ذخیره دور بعد : {{$log->for_next_round_balance_direction}}</li>
                        @else
                            <li>ذخیره دور بعد : {{$log->for_nex_month_save_direction}}</li>
                        @endif

                    @endif

                </ul>
                <hr />
                <ul>
                    @foreach($log->left->children as $child )
                        <li style="direction: rtl">{{$child->name}} -<span class="badge badge-dark"> {{$child->point}}</span> </li>
                    @endforeach
                </ul>
            </div>
        </div>


    </div>
    <div class="col-6">

        <div class="card dark-card">
            <div class="card-header">سمت راست</div>
            <div class="card-body">
                <ul>
                    <li>کاربر ها : {{$log->right->users}}</li>
                    <li>امتیاز کاربر ها : {{$log->right->points}}</li>
                    @if(isset($log->right->left_over))
                        <li>زخیره ماه قبل : {{$log->right->left_over}}</li>
                    @endif

                    @if(isset($log->right->total_point))
                        <li>جمع امتیاز : {{$log->right->total_point}}</li>
                    @endif


                    @if(isset($log->right->total_point))

                        @if($log->right->total_point < $log->left->total_point)
                            <li>ذخیره دور بعد : {{$log->for_next_round_balance_direction}}</li>
                        @else
                            <li>ذخیره دور بعد : {{$log->for_nex_month_save_direction}}</li>
                        @endif


                    @else


                        @if($log->right->points < $log->left->points)
                            <li>ذخیره دور بعد : {{$log->for_next_round_balance_direction}}</li>
                        @else
                            <li>ذخیره دور بعد : {{$log->for_nex_month_save_direction}}</li>
                        @endif

                    @endif
                </ul>
                <hr />
                <ul>
                    @foreach($log->right->children as $child )
                        <li style="direction: rtl">{{$child->name}} -<span class="badge badge-dark"> {{$child->point}}</span> </li>
                    @endforeach
                </ul>
            </div>
        </div>


    </div>
</div>
