
@extends('master')

@section('main')
    <div class="uk-container uk-margin-large-top">
        <div class="uk-child-width-1-3@m uk-child-width-1-1@s" uk-grid>
            <div></div>
            <div >
                <div class="uk-card uk-card-default">
                    <div class="uk-card-header">{{ __('Reset Password') }}</div>

                    <div class="uk-card-body">
                        @if (session('status'))
                            <div class="uk-alert uk-alert-success uk-margin-top" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif

                        <form method="POST" class="uk-padding" action="{{ route('password.email') }}">
                            @csrf

                            <div class="form-group row">
                                <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                                <div class="col-md-6">
                                    <input id="email" type="email" class="uk-input uk-form-large form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                    @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <hr />

                            <div class="">
                                <button type="submit" class="uk-button uk-button-primary uk-width-1-1" style="font-size: 13px">
                                    {{ __('Send Password Reset Link') }}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div></div>
        </div>
    </div>
@endsection
