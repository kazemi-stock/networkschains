
function document_location(location){

    if ($.support.pjax)
    {
        $.pjax({url: location, container: '#pjax-container' , fragment: "#pjax-container" })

    }
    else
        document.location = location ;

}

$(document).on('change' , '#company-auth-selector select' , function () {
$('.company-auth-card').addClass('uk-hidden');
$(`.company-auth-card[data-id="${$(this).val()}"]`).removeClass('uk-hidden');
})


$(document).on('click' , '.store-btn' , function () {

    var  obj = {};
    $( $(this).data('selector')).each(function(){
        obj[$(this).data('id')] = this.value ;
    })


    if($(`${$(this).data('selector')}-editor`).length > 0 )
    {
        obj[$(`${$(this).data('selector')}-editor`).data('id')] = CKEDITOR.instances[$(`${$(this).data('selector')}-editor`).data('id')].getData();
    }

    if($(`${$(this).data('selector')}-uploader`).length > 0 )
    {

        $(`${$(this).data('selector')}-uploader`).each(function(){
            if($(this).find('.success-upload').length == 1 )
            {
                obj[$(this).data('id')] = $(this).find('.success-upload').data('token');
            }
        })

    }

    if($(`${$(this).data('selector')}-chain`).length > 0 )
    {
        let  chain_id = $(`${$(this).data('selector')}-chain`).data('id') ;
        obj[chain_id] = [] ;

        $(`${$(this).data('selector')}-chain`).find('.chain-input').each(function(){
            if(this.value > 0  )
            {
                obj[chain_id].push(this.value);
            }
        })

    }

    var  btn = $(this);
    ajax_call(btn , obj );

})



function ajax_call(btn, obj ) {

    output = typeof output  != 'undefined' ? output : 'refresh';

    loadspiner(btn);
    $.post(btn.data('route') , csrf(obj) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            if(typeof data.msg != 'undefined')
                ok(data.msg);
            if(typeof data.replace != 'undefined')
            {
                $(data.replace).html(data.html);
            }

            if(typeof btn.data('callback') != 'undefined')
            {
                let actions = btn.data('callback').split(',');
                for(i in actions)
                {
                    if( actions[i] == 'empty' )
                    {
                        $( btn.data('selector') ).each(function(){
                            $(this).val('');
                        })
                    }
                    if( actions[i] == 'remove' )
                    {
                        btn.remove();
                    }
                    if(actions[i].indexOf('replace') > -1  )
                    {
                        btn.replaceWith(actions[i].replace('replace:' , ''));
                    }
                }
            }

            if(typeof data.url != 'undefined')
            {
                if(data.url =='current')
                    document_location( document.location );

                else if(btn.hasClass('reload'))
                {
                    document.location =  data.url  ;
                    console.log('reload');

                }
                else
                {
                    console.log('pjax');
                    document_location( data.url  );
                }

            }

        }
        else
        {
            er(data.msg);
        }
    })

}

$(document).ready(function () {
    if ($.support.pjax) {
        $.pjax.defaults.timeout = 20000; // time in milliseconds
        $(document).on('pjax:send', function() {
            $('#spinneroverlay').show();
        })

        $(document).on('pjax:complete', function() {
            $('#spinneroverlay').hide();
            course_tags();
            redate();
            summernote();
        })
        $(document).on('pjax:error', function() {
            return false ;
        })

        $(document).pjax('.pjax', '#pjax-container' , { fragment: "#pjax-container" })


        $(document).on('click' , '.pjax-pagination .page-link' , function(){
            event.preventDefault();
            $.pjax({url: $(this).attr('href'), container: `#${$(this).parents('.pagination-wrapper:first').attr('id')}` });

        })

    }

});

$(document).on('click' , '.global-delete-btn' , function () {

    let btn = $(this);
    let w = $(this).parents(`${btn.data('wrapper')}:first`);
    if(typeof  $(this).data('prog') != 'undefined')
    {
        var  prog = w.find( $(this).data('prog'));
    }
    else
        var  prog = btn ;


    if(prog.hasClass('inprogdelete')) return ;

    if(typeof UIkit != 'undefined')
    {
        UIkit.modal.confirm(' آیا از انجام این عملیات مطمئن هستید ؟ ', { labels: { ok: 'بله انجام بده', cancel: 'کنسل' } }).then(function() {
            prog.addClass('inprogdelete');
            $.post(btn.data('route') , csrf({}) , function(data){
                data = $.parseJSON(data);
                if(data.stat == 'ok')
                {
                    w.remove();
                }
                else
                    prog.removeClass('inprogdelete');
            })

        }, function () {
            return false;
        });
    }
    else
    {
        var c = confirm('آیا از عملیات حذف اطمینان دارید ؟');
        if(!c) return false;
        loadspiner(prog);
        $.post(btn.data('route') , csrf({}) , function(data){
            data = $.parseJSON(data);
            if(data.stat == 'ok')
            {
                w.remove();
            }
            else
                unloadspiner(prog);
        })


    }




})






$(document).on('click' , '.delete-notification-btn' , function() {

    let btn = $(this);
    if(btn.hasClass('inprogdelete'))
        return ;
    btn.addClass('inprogdelete');

    $.post(btn.data('route') , csrf({}) , function(data){

        data = $.parseJSON(data);
        btn.removeClass('inprogdelete');

        if(data.stat == 'ok')
        {
            if(data.type === 'all')
            {
                if( $('#notifications-index-wrapper').length > 0 )
                    $('#notifications-index-wrapper').html('<div class="alert alert-warning"> شما هیچ اطلاعیه ای ندارید  </div>');
                $('#notifications-global-wrapper').html('');
            }
            else
                btn.parents('.not-row:first').remove();
        }
        else
        {
            btn.removeClass('inprogdelete');
            er(data.msg);

        }

    })

});


$(document).on('click' , '#check-details' , function () {

    btn  = $(this) ;
    el = $('#page-url') ;
    loadspiner(btn);
    $.post($(this).data('route') , csrf({url : el.val() , title : $('#stock-title').val()}) , function(data){

        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            $('#api-url').val(data.api_url);
            $('#stock_price_id').val(data.stock_price_id);
            $('#stock-title').val(data.title);
            $('#strike-price').val(data.strike_price);
        }
        else
        {
            er(data.msg);
        }


    })

})

$(document).on('click' , '#update-profile-btn' , function() {

    let obj = {  };
    $(this).parents('#profile-edit-wrapper:first').find('.uk-input').each(function(){
        obj[$(this).data('id')] = $(this).val() ;
    })


    let btn = $(this);
    ajax_call(btn , obj );

});
$(document).on('click' , '#update-profile-password-btn' , function() {

    let obj = {  };
    $(this).parents('#profile-password-edit-wrapper:first').find('.uk-input').each(function(){
        obj[$(this).data('id')] = $(this).val() ;
    })
    let btn = $(this);
    ajax_call(btn , obj );

});

$(document).on('click' , '#send-ticket-btn' , function() {


    let obj = {

        title : $('#ticket-send-wrapper').find('#ticket-title').val() ,
        text  : $('#ticket-send-wrapper').find('#ticket-text').val() ,
    };


    let btn = $(this);
    loadspiner(btn);

    $.post(btn.data('route') , csrf(obj) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            ok('پیام شما با موفقیت ارسال شد ');

            if( $('#ticket-index-wrapper').length > 0 && typeof data.html != 'indefined' )
                $('#ticket-index-wrapper').html(data.html);

            $('#ticket-send-wrapper').find('#ticket-title').val('');
            $('#ticket-send-wrapper').find('#ticket-text').val('');

            if($('#modal-tciket-send').length > 0 )
                UIkit.modal('#modal-tciket-send').hide();

        }
        else
            er(data.msg);

    })

});



$(document).on('change' , '.category-chain-input' , function () {

    let w   = $(this).parents('.category-chain-globbal-wrapper:first') ;
    w.find('.category-chain-input').attr('disabled' , true );
    $(this).parents('.category-chain-this-wrapper:first').nextAll('.category-chain-this-wrapper').remove() ;


    $.post($(this).data('route') , csrf({ id : this.value }) , function(data){

        data = $.parseJSON(data);
        console.log(data.subcategories);
        w.find('.category-chain-input').attr('disabled' , false );
        if(data.stat == 'ok' && data.subcategories.length > 0 )
        {
            let options = '<option value="0">انتخاب کنید</option>';
            data.subcategories.forEach( function(k , v ){
                console.log(k);
                options += `<option value="${k.id}">${ k.title }</option>` ;
            })

            w.append(`
            
                        <div class="form-group category-chain-this-wrapper">
                            <div class="input-icon" data-id="text">
                                <label> دسته  </label>
                                <select class="form-control category-chain-input chain-input" data-route="${data.route}">${options}</select>
                            </div>
                        </div>

            
            `);

        }
    })

})

$(document).on('click' , '#send-ticket-reply-btn' , function() {

    let obj = {
        text  : $('#ticket-send-wrapper').find('#ticket-text').val() ,
    };
    let btn = $(this);
    loadspiner(btn);

    $.post(btn.data('route') , csrf(obj) , function(data){
        unloadspiner(btn);
        data = $.parseJSON(data);
        if(data.stat == 'ok')
        {
            $('#ticket-dialog-wrapper').html(data.html);
            $('#ticket-send-wrapper').find('#ticket-text').val('');
        }
        else
            er(data.msg);

    })

});

