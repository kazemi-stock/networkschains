@extends('cp.master')


@section('main')

    <div class="container-fluid">


        <div class="row">
            <div class="col-md-12 col-12  float-right pull-right">
                <div class="card dark-card no-shadow" >

                    <div class="border-bottom">
                        <h4 class="card-title">مشخصات پروفایل</h4>
                    </div>

                    <div class="card-body">
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" >نام</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" data-id="name" >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" >موبایل</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" data-id="mobile" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" >ایمیل</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" data-id="email" value="">
                            </div>
                        </div>



                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" >رمز عبور</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" data-id="password" value="">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label yekan" >تکرار رمز</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" data-id="password_confirmation" value="">
                            </div>
                        </div>

                        <hr />
                        <a class="btn btn-success save-new-user" data-route="{{route('cp_user_store')}}"  >
                            <span class="nospiner">  ثبت کاربر جدید</span>
                            <div class="spinner-border   spiner" role="status" >
                                <span class="sr-only"></span>
                            </div>
                        </a>

                    </div>
                </div>
            </div>



        </div>

    </div>

    <script>


        $(document).on('click' , '.save-new-user' , function(){
            let data = {  } ;
            $(this).parents('.card:first').find('.form-control').each(function () {
                data[$(this).data('id')] = this.value ;
            })

            var btn = $(this);

            loadspiner( btn);
            $.post( btn.data('route') , csrf(data) , function(data){
                unloadspiner(btn);
                data = $.parseJSON(data);
                if(data.stat == 'ok')
                {
                    ok('با موفقیت انجام شد');
                    document.location = data.location ;
                }
                else
                    er(data.msg);
            });

        })
     </script>


@endsection
