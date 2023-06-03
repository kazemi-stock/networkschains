@foreach($global_notification as $notification )
    @if($notification['count'] < 1 )
        @continue
    @endif
    <!-- Message -->
    <a href="{{$notification['route']}}" class="link border-top new-notification">
        <div class="d-flex no-block align-items-center p-10">
            <span class="btn btn-success btn-circle"><i class="ti-calendar"></i></span>
            <div class="m-r-10">
                <h5 class="m-b-1"> {{$notification['title']}} </h5>
                <span class="mail-desc"> {{$notification['count']}} {{$notification['title']}}</span>
            </div>
        </div>
    </a>
@endforeach
