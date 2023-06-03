@if(!$withdraws->isEmpty())
    <table class="uk-table uk-table-bordered table-white  uk-table-ruge rtl uk-text-center">
        <tr>
            <th>شناسه</th>
            <th>مبلغ</th>
            <th>تاریخ</th>
            <th>وضعیت</th>
        </tr>
        @foreach($withdraws as $wr )
            <tr>
                <td class="number">{{$wr->id}}</td>
                <td class="number">{{price($wr->amount)}}</td>
                <td class="number">{{jdate($wr->created_at)}}</td>
                <td>

                    @if($wr->Result)
                        <div class="uk-alert uk-alert-success">
                            <ul class="uk-list uk-list-bullet uk-text-right fs13 ">
                                <li class="uk-text-muted"> واریز شد</li>
                                <li class="uk-text-muted"> تاریخ : {{jdate($wr->Result->created_at)}} </li>
                                <li class="uk-text-muted"> توضیحات : {{($wr->Result->text)}} </li>
                            </ul>
                        </div>

                    @else
                        <div class="uk-alert uk-alert-warning"><i class="fas fa-walking uk-margin-small-left"></i>در حال بررسی </div>
                     @endif



                </td>

            </tr>
        @endforeach
    </table>
@else
    <div class="uk-alert uk-alert-danger">شما تا کنون درخواست تصویه ای نداشته اید </div>
@endif
