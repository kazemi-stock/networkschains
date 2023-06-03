@extends( 'master')

@section('main')


    <div class="uk-container  uk-container-large uk-margin-large-top">








        <div class="uk-padding-large">

            <div class="uk-child-width-1-2@m uk-child-width-1-1@s  uk-grid-match" uk-grid>

                <div>
                    <div class="uk-card uk-card-default">
                <div class="uk-card-header uk-text-bold" >
                    Update Account :
                </div>
                <div class="uk-card-body">
                    <br />

                    <div class="uk-child-width-1-1" uk-grid>

                        <div >
                            <div class="uk-margin-small">
                                Email :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block" >
                                        <span class="uk-form-icon"><i class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large account-input"  data-id="email"  type="text" placeholder=""  value="{{Auth::user()->email}}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div >
                            <div class="uk-margin-small">
                                Name :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block" >
                                        <span class="uk-form-icon"><i class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large account-input"  data-id="name"  type="text" placeholder=""  value="{{Auth::user()->name}}">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <hr />
                    <div>
                        {!! button( ['attr'=> [ 'class' => 'uk-button uk-button-secondary store-btn'  , 'data-selector'=>'.account-input' ,  'data-route'=> route('dashboard.setting.update.account') ],'text'=>'UPDATE ' ]) !!}
                    </div>
                </div>
            </div>
                </div>
                <div>
                    <div class="uk-card uk-card-default">
                <div class="uk-card-header uk-text-bold" >
                    Update Password :
                </div>
                <div class="uk-card-body">
                    <br />

                    <div class="uk-child-width-1-1" uk-grid>

                        <div >
                            <div class="uk-margin-small">
                                Current Password :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block" >
                                        <span class="uk-form-icon"><i class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large password-input"  data-id="current_password"  type="password"    >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div >
                            <div class="uk-margin-small">
                                New Password  :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block" >
                                        <span class="uk-form-icon"><i class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large password-input"  data-id="new_password"  type="password" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div >
                            <div class="uk-margin-small">
                               Type New Password  Again :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <div class="uk-inline uk-display-block" >
                                        <span class="uk-form-icon"><i class="fas fa-sticky-note icon-medium"></i></span>
                                        <input class=" uk-input uk-form-large password-input"  data-id="new_password_confirmation"  type="password" >
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <hr />
                    <div>
                        {!! button( ['attr'=> [ 'class' => 'uk-button uk-button-secondary store-btn'  , 'data-selector'=>'.password-input' ,  'data-route'=> route('dashboard.setting.update.password') ],'text'=>'UPDATE ' ]) !!}
                    </div>
                </div>
            </div>
                </div>



            </div>


        </div>

        <hr />




    </div>

@endsection
