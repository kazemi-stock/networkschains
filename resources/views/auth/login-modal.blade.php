<div class="uk-container uk-container-large uk-padding-large" >

    <div class="uk-child-width-1-3@m uk-child-width-1-1@s" uk-grid>

        <div> </div>
        <div>
            @php($company_list = ['Company1'=>'nu skin products' ,'testing'=>'Natura International' , 'Company2'=>'Mary Kay Inc' , 'Company5'=>'Yofoto' , 'Company6'=>'en.ziranyixue' , 'Company7'=>'tiens' , 'Company8'=>'rolmex' ,
                                  'Company9'=>'modicare' , 'Company10'=>'appollochina' , 'Company11'=>'pruvit' , 'Company12'=>'cosway' , 'Company13'=>'mikiprune.co' , 'Company14'=>'amorepacific' , 'Company15'=>'teamnational' ,
                                  'Company16'=>'longrich' ,
                                  'Company3'=>'Infinitus Global','Pazhtazan'=>'Online University' , 'Company4'=>'Vorwerkmlm']  )

            <div class="uk-margin uk-width-large uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-large">
            <div class="uk-margin">
                <div class="uk-inline uk-width-1-1" id="company-auth-selector">

                        {!! select( $company_list , 'company' , old('company')  , 1 , 'Select Your Company') !!}
                </div>
            </div>
            </div>

            @foreach($company_list as $k=>$clist )

            @if($k == 'Pazhtazan')

                    <div data-id="Pazhtazan" class="{{old('company') == 'Pazhtazan' ? '' : 'uk-hidden'}} company-auth-card  uk-margin uk-width-large uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-large">
                        <h3 class="uk-card-title uk-text-center">{{$clist}}</h3>
                        <form method="POST" action="{{ route('login') }}">
                            <input type="hidden" name="company" value="Pazhtazan">
                            @csrf
                            <div class="uk-margin-small">
                                Agent Code :
                            </div>
                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <span class="uk-form-icon" uk-icon="icon: hashtag"></span>
                                    <input class="uk-input uk-form-large" type="text" name="token">
                                </div>
                            </div>

                            @error('token')
                            <div class="uk-form-label yekan input-error "> {{ $message }}</div>
                            @enderror
                            <div class="uk-margin-small">
                                Password :
                            </div>

                            <div class="uk-margin">
                                <div class="uk-inline uk-width-1-1">
                                    <span class="uk-form-icon" uk-icon="icon: lock"></span>
                                    <input class="uk-input uk-form-large" type="password" name="password">
                                </div>
                            </div>

                            @error('password')
                            <div class="uk-form-label yekan input-error"> {{ $message }} </div>
                            @enderror

                            <div class="uk-margin">
                                <button class="uk-button uk-button-primary uk-button-large uk-width-1-1">SIGN IN</button>
                            </div>
                            <div class="uk-margin">
                                <a href="{{url('password/reset')}}">Forgot your password?</a>
                            </div>
                        </form>
                    </div>

            @else
                    <div data-id="{{$k}}" class="{{old('company') == $k ? '' : 'uk-hidden'}} company-auth-card  uk-margin uk-width-large uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-large">
                <h3 class="uk-card-title uk-text-center">{{$clist}}</h3>
                <form method="POST" action="{{ route('login') }}">
                    <input type="hidden" name="company" value="{{$k}}">
                    @csrf
                    <div class="uk-margin-small">
                        Email :
                    </div>
                    <div class="uk-margin">
                        <div class="uk-inline uk-width-1-1">
                            <span class="uk-form-icon" uk-icon="icon: mail"></span>
                            <input class="uk-input uk-form-large" type="text" name="email">
                        </div>
                    </div>

                    @error('token')
                    <div class="uk-form-label yekan input-error"> These credentials do not match our records.  </div>
                    @enderror
                    <div class="uk-margin-small">
                        Password :
                    </div>

                    <div class="uk-margin">
                        <div class="uk-inline uk-width-1-1">
                            <span class="uk-form-icon" uk-icon="icon: lock"></span>
                            <input class="uk-input uk-form-large" type="password" name="password">
                        </div>
                    </div>

                    @error('password')
                    <div class="uk-form-label yekan input-error"> {{ $message }} </div>
                    @enderror

                    <div class="uk-margin">
                        <button class="uk-button uk-button-primary uk-button-large uk-width-1-1">LOGIN</button>
                    </div>
                </form>
            </div>
            @endif

            @endforeach






        </div>
        <div></div>

    </div>


</div>
