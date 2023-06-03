<div class="upload-btn-wrapper">
    <button class="uk-button {{isset( $ucls ) ? $ucls : 'uk-button-primary'}}   yekan fs13">
        {{isset( $utext ) ? $utext : 'آپلود فایل'}}

        <i class="fas {{isset( $uicon ) ? $uicon : 'fa-arrow-up'}} uk-margin-small-left"></i>

    </button>
    <input type="file" name="file" class="standard-upload-files" data-route="{{ $uroute }}"  @if(isset($ucallback)) data-callback="{{$ucallback}}" @endif >
</div>
