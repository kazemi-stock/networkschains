<div class="row">
    <div class="form-group col-md-4">
        <label for="fname" class="col-sm-3 text-right control-label col-form-label " > نام کاربری</label>
        <div class="col-sm-12">
            <input type="text" class="form-control"  data-id="SmtpUsername" value="{{$settings->SmtpUsername}}">
        </div>
    </div>
    <div class="form-group col-md-4">
        <label for="fname" class="col-sm-3 text-right control-label col-form-label " > رمز عبور</label>
        <div class="col-sm-12">
            <input type="text" class="form-control"  data-id="SmtpPassword" value="{{$settings->SmtpPassword}}">
        </div>
    </div>
    <div class="form-group col-md-4">
        <label for="fname" class="col-sm-3 text-right control-label col-form-label " > پورت</label>
        <div class="col-sm-12">
            <input type="text" class="form-control"  data-id="SmtpPort" value="{{$settings->SmtpPort}}">
        </div>
    </div>
</div>
