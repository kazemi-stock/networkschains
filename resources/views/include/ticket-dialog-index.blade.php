
@foreach($ticket->Dialog as $dialog )
    <div  class="paper no-shadow uk-link-reset">
        <div class="uk-flex-middle" uk-grid>
            <div class="uk-width-1-6 uk-flex-first uk-text-center">
                <img src="{{avatar_url($dialog->User)}}" class="uk-border-circle " style="max-height: 70px ; max-width: 70px">
            </div>
            <div class="uk-width-5-6">
                <h4 class="uk-margin-remove">  </h4>
                <p class="uk-margin-remove-top uk-margin-small-bottom fs13">   {{$dialog->text}} </p>
                <div>
                    <span class="uk-text-middle ">
                        <p class="uk-text-small uk-margin-remove-bottom number color-gray">   {{jdate($dialog->created_at)}} </p>
                        <p class="yekan uk-text-small uk-margin-remove-top color-gray">   {{$dialog->User->name}}</p>
                    </span>
                </div>
            </div>
        </div>
    </div>
@endforeach

