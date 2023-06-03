<form method="POST" action="{{ route('register') }}">
    @csrf


    <div class="uk-form-label"> ایمیل</div>
    <div class="uk-inline">
        <span class="uk-form-icon"><i class="fas fa-at icon-medium"></i></span>
        <input class="uk-input number uk-nav-shadow uk-box-shadow-hover-large uk-form-width-large @error('email') uk-form-danger @enderror"  name="email"  value="{{ old('email') }}"   type="text">
    </div>


    @error('email')
    <div class="uk-form-label yekan input-error">  {{ str_replace('email' , 'ایمیل' , $message ) }}</div>
    @enderror


    <div class="uk-form-label">نام کاربری </div>
    <div class="uk-inline">
        <span class="uk-form-icon"><i class="fas fa-user icon-medium"></i></span>
        <input class="uk-input uk-nav-shadow uk-box-shadow-hover-large uk-form-width-large  @error('name') uk-form-danger @enderror" name="name"  value="{{ old('name') }}" placeholder="نام کاربری " type="text">
    </div>

    @error('name')
    <div class="uk-form-label yekan input-error">  {{ str_replace('name' , 'نام کاربری' , $message ) }}</div>
    @enderror


    <div class="uk-child-width-1-2@m uk-grid-small rtl" uk-grid>

        <div>
            <div class="uk-form-label">رمز عبور </div>
              <div class="uk-inline">
                <span class="uk-form-icon"><i class="fas fa-lock icon-medium"></i></span>
            <input class="uk-input uk-nav-shadow uk-box-shadow-hover-large @error('password') uk-form-danger @enderror" placeholder="حداقل 8 کاراکتر ..." type="Password" id="password-1" name="password_confirmation">
              </div>
            @error('password')
            <div class="uk-form-label yekan input-error">  رمز های عبور یکسان با حداقل 8 کاراکتر وارد کنید</div>
            @enderror
        </div>
        <div>
            <div class="uk-form-label">تکرار رمز عبور</div>
              <div class="uk-inline">
                <span class="uk-form-icon"><i class="fas fa-undo icon-medium"></i></span>
            <input class="uk-input uk-nav-shadow uk-box-shadow-hover-large" placeholder="" type="password"  id="password-2" name="password">
             </div>
        </div>

    </div>

    {{--                        <div>--}}
    {{--                            <label>--}}
    {{--                                <input class="uk-checkbox" type="checkbox" data-show-pw="#password-1 ,#password-2">--}}
    {{--                                <span class="checkmark uk-text-small"> Show passwords </span>--}}
    {{--                            </label>--}}
    {{--                        </div>--}}
    <hr />
    <div class="uk-margin yekan">
        <label style="direction: rtl">
            <span class="checkmark uk-text-small"> با قوانین سایت موافقم </span>
            <a href="https://www.mcls.gov.ir/fa/law/225" target="_blank" class=" uk-text-small"> مشاهده قوانین  </a>
            <input class="uk-checkbox" type="checkbox" >

        </label>
    </div>
    <hr />
    <div class=" uk-flex-middle" uk-grid>
        <div class="uk-width-auto@m">

        </div>
        <div class="uk-width-expand@m">
            <button class="uk-button uk-button-primary uk-box-shadow-large" type="submit" style="border-radius: 4px!important;" >
                <div class="nospiner">ثبت نام</div>
                <div class="spiner uk-spinner" uk-spinner></div>
            </button>
        </div>

    </div>

</form>
