@if($tickets->isEmpty())
    <div class="uk-alert uk-alert-warning">شما پیام جدیدی ندارید </div>
@else
    <div class="uk-overflow-auto">

<table class="table table-white uk-table uk-table-divider uk-table-right  uk-table-ruge">
    <tr>
        <th> عنوان </th>
        <th> تاریخ ارسال  </th>
        <th> وضعیت  </th>
        <th> مشاهده  </th>
    </tr>
    @foreach($tickets as $ticket )
        <tr>
            <td class="fs17 " width="40%">  {{$ticket->title}} </td>
            <td class="number" style="color: gray "> {{jdate($ticket->created_at)}}  </td>
            <td class="yekan">

                @if($ticket->user_alert == 1 )
                    <span class="color-red"><i class="fas fa-envelope-open"></i>   جدید</span>
                @else
                    خوانده شده

                @endif

            </td>
            <td> <a class="uk-button uk-button-secondary" href="{{route('dashboard_ticket_show' ,['id'=>$ticket->id ])}}">مشاهده</a>  </td>
        </tr>
    @endforeach

</table>
</div>
@endif
