$(document).ready(function(){

    // does current browser support PJAX
    if ($.support.pjax) {
        $.pjax.defaults.timeout = 10000; // time in milliseconds
        $(document).on('pjax:send', function() {
            $('#pjax-loader-wrapper').show();
        })

        $(document).on('pjax:complete', function() {
            $('#pjax-loader-wrapper').hide();
        })

        $(document).pjax('.pjax', '#main-container')

    }

});


$(document).on('click' , '.init-order-btn' ,  function () {

    let f = $(this).parents('.form:first');
    var btn = $(this);
    let obj = {} ;
    f.find('.form-control[type="text"],select').each(function(){
        obj[$(this).data('id')] = $(this).hasClass('numeric') ? number($(this).val()) : $(this).val();
    })

    f.find('.form-control[type="checkbox"]').each(function(){
        obj[$(this).data('id')] =  this.checked ? 1 : 0 ;
    })
    loadspiner(btn);


    $.post( btn.data('route') , csrf(obj) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            ok('با موفقیت ثبت شد');
        }
        else
            er(data.msg);

    });





})


$(document).on('click' , '.notification-see-btn' ,  function () {

    var btn = $(this);
    loadspiner(btn);

    $.post( btn.data('route') , csrf({}) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            let status_btn = btn.parents('tr:first').find('.status');
            if(status_btn.hasClass('badge-danger'))
            {
                status_btn.removeClass('badge-danger');
                status_btn.addClass('badge-success').html('خوانده شده');
            }
            update_global_notifications(data.global_notification);

            $('#master-modal .modal-body').html(data.text);
            $('#master-modal').modal('show');
        }
        else
            er(data.msg);

    });

})


function update_global_notifications(global_notification){
    if(global_notification > 0 )
    {
        $('#notification-alert-wrapper').html(`
                        <span class="btn btn-danger btn-circle"><i class="mdi mdi-bell" ></i></span>
                        <div class="m-r-10">
                        
                        <h5 class="m-b-1" style="text-align: right">اطلاعیه ! </h5>
                        <span class="mail-desc"> شما ${global_notification} اطلاعیه جدید دارید  </span>
                        
                        </div>
                `);
        $('#notification-alert-icon').addClass('blink_me');
    }
    else
    {
        $('#notification-alert-wrapper').html(`
                        <span class="btn btn-secondary btn-circle"><i class="mdi mdi-bell" ></i></span>
                        <div class="m-r-10">
                        <h5 class="m-b-1" style="text-align: right">اطلاعیه ! </h5>
                        <span class="mail-desc"> مورد جدیدی نیست !</span>
                        </div>
                `);
        $('#notification-alert-icon').removeClass('blink_me');


    }

}





$(document).on('click' , '#credit-document-btn' , function(){


    if($('.credit-target-account:checked').length != 1 )
    {
        er(' گزینه کارت مقصد را انتخاب کنید');
        return false;
    }
    var obj = {

        target_account : $('.credit-target-account:checked').val()
    } ;

    $('#credit-document-wrapper').find('.form-control').each(function(){
        obj[$(this).data('id')] = $(this).val();
    })

    var btn = $(this);
    loadspiner(btn);
    $.post(btn.data('route') , csrf(obj) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
            ok('با موقفیت ثبت شد');
        else
            er(data.msg);

    })
})



$(document).on('click' , '#save-profile-btn' , function(){
    let data = {} ;
    $('#personal-info').find('.form-control').each(function(){
        data[$(this).data('id')] = $(this).val();
    })
    $('#contact-info').find('.form-control').each(function(){
        data[$(this).data('id')] = $(this).val();
    })

    data.bank = [] ;

    $('#bank-account-wrapper').find('.bacc-row').each(function(){
        data.bank.push({
            card : $(this).find('.card-num').val() ,
            shaba : $(this).find('.shaba-num').val() ,
        });
    })
    var btn = $(this);
    loadspiner(btn);
    $.post(btn.data('route') , csrf(data) , function(data){
        unloadspiner($('#save-btn'));
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            if ($.support.pjax)
            {
                ok('اطلاعات شما با موفقیت ذخیره شد')
                $.pjax.reload('#main-container' , {scrollTo:0});

            }
            else
             document.location = document.location ;
        }
        else
            er(data.msg);
    });
})


$(document).on('click' , '#save-user-notification-btn', function(){
    let data = {} ;
    let erro = false ;
    $('#notification-card').find('.form-group').each(function(){
        if($(this).find('.notification-radio:checked').length == 1 )
        {
            data[$(this).find('.notification-radio:checked').attr('name')] = $(this).find('.notification-radio:checked').val();
        }
        else
            erro = true ;
    })

    if(erro)
    {
        er('لطفا همه موارد خواسته شده را تنظیم کنید');
        return false;
    }
    var btn = $(this);
    loadspiner(btn);
    $.post(btn.data('route') , csrf(data) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            ok('تنظیمات با موفقیت ذخیره شد');
        }
        else
            er(data.msg);
    });

})


$(document).on('click' , '#save-user-notification-btn', function(){
    let data = {} ;

    $('#password-update-card').find('.form-control').each(function(){
        data[$(this).data('id')] = $(this).val();
    })

    var btn = $(this);
    loadspiner(btn);
    $.post(btn.data('route') , csrf(data) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            ok('رمز عبور شما با موفقیت آپدیت شد');
        }
        else
            er(data.msg);
    });

})


$(document).on('click' , '#save-ticket-btn' , function(){
    let data = {
        title : $('#ticket-title').val() ,
        text : $('#ticket-text').val()
    } ;
    var btn = $(this);

    loadspiner(btn);
    $.post(btn.data('route')  , csrf(data) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            $('#nav-ticket-index').html(data.html);
            ok('با موفقت ارسال شد ');
            $('#ticket-title , #ticket-text').val('');
        }
        else
            er(data.msg);
    });

})




$(document).on('click' , '#save-ticket-dialog-btn' , function(){


    let data = {
        text : $('#dailog-text').val()
    } ;
    let btn = $(this);
    loadspiner(btn);
    $.post(btn.data('route') , csrf(data) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            $('#chat-list').html(data.html);
            ok('با موفقت ارسال شد ');
            $('#dailog-text').val('');
        }
        else
            er(data.msg);
    });


})

$(document).on('click' , '.create-wallet' , function(){

    var id = $(this).data('id');

    let spwrapper = $(this).parents('.action-button:first') ;
    if($(`.coine-wallet[data-id="${id}"]`).length == 1 )
    {
        modal( $(`.coine-wallet[data-id="${id}"]`).html());
        return ;
    }

    loadspiner(spwrapper);

    $.post($(this).data('route')  , csrf({id: id}) , function(data){
        unloadspiner(spwrapper);

        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            ok('کیف پول شما با موفقیت ساخته شد');
            modal(data.html);

        }
        else
        {
            er(data.msg);
        }
    })
})



// ================================ PROFILE ===============


function add_bacc_row(){

    $('#bank-account-wrapper').append(`

            <div class="bacc-row">
                                    <div class="row">
                                        <div class="col-md-5 col-12">
                                            <div class="form-group">
                                                <label style="display: block">شماره کارت <small class="text-muted float-left">16رقم</small></label>
                                                <input type="text" class="form-control  card-num  text-left"   >
                                            </div>
                                        </div>
                                        <div class="col-md-5 col-12">
                                            <div class="form-group">
                                                <label style="display: block">شماره شبا <small class="text-muted float-left">  24 رقم </small></label>

                                                <div class="input-group">
                                                    <input type="text" class="form-control shaba-num text-left"  aria-describedby="basic-addon1">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">IR</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group" style=" ">
                                                <label style="opacity: 0; display: block"> - </label>
                                                <a  href="javascript:void(0)" class="text-danger bacc-remove">  <i class="mdi mdi-window-close"></i> </a>

                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                </div>
            `);


}



$(document).on('click' , '.bacc-remove' , function(){
    $(this).parents('.bacc-row:first').remove();
})
