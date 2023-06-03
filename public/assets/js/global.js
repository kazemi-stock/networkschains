$(document).on('click', '.copy-to-clip' , function(){
    console.log($(this).parents('.copy-wrapper:first').find('.paset-to-clip').html());
    copyToClipboard($(this).parents('.copy-wrapper:first').find('.paset-to-clip')[0]);
})


function csrf(obj){
    let token = $('input[name=_token]').val();
    obj._token = token ;
    return obj;
}
function prep_msg(msg) {

    if( $.isArray(msg) || $.isPlainObject(msg))
    {   console.log('it is !');
        var str = '<ul style="list-style: none">';
        $.each( msg , function (k,v)
        {
            str +=  `<li>${v}</li>`;
        })

        str += '</ul>';

        msg = str ;
    }

    return msg ;

}


function loadspiner(container){
    container.find('.spiner').show();
    container.find('.nospiner').hide();
    container.prop("disabled", true).addClass('disabled');

}
function unloadspiner(container) {
    container.find('.spiner').hide();
    container.find('.nospiner').show();
    container.prop("disabled", false).removeClass('disabled');


}



function er(msg){


    Swal.fire({
        title: 'Error',
        html: prep_msg(msg) ,
        icon: 'error',
        confirmButtonText: 'Close'
    })

}
function ok(msg){

    Swal.fire({
        title: 'Message',
        html: prep_msg(msg) ,
        icon: 'success',
        confirmButtonText: 'Close'
    })

}

function modal(msg){

    $('#master-modal').find('.modal-body').html(msg);
    $('#master-modal').modal('show');
}


$(document).on('click' , '.destroy-item-btn' , function () {

    var btn = $(this);
    var ids = new Array();

    var c = confirm('آیا از عملیات حذف اطمینان دارید ؟');
    if(!c) return false;


    if(btn.hasClass('destroy-item-all'))
    {
        $('.ids').each(function(){
            if(this.checked)
            {
                ids.push($(this).val());
                $(this).parents('.item-row:first').find('.destroy-item-btn').css('opacity' , '0.2');
            }

        })
    }
    else
        ids.push($(this).data('id'));

    if(ids.length < 1 )
    {
        er('هیچ گزینه ای را انتخاب نکرده اید!');
        return false;
    }


    btn.css('opacity' , '0.2');



    $.post( btn.data('route') , csrf({ids:ids }) , function(data){

        data = $.parseJSON(data);
        if(data.stat == 'ok')
            if(btn.hasClass('destroy-item-all'))
            {
                btn.css('opacity' , '1');
                $('.ids').each(function(){
                    if(this.checked)
                    {
                        $(this).parents('.item-row:first').remove();
                    }
                })
            }
            else
                btn.parents('.item-row:first').remove();
        else
            alert(data.msg);

    });


})

/**************** numbers ****************/

$(document).on('keyup' , '.numeric' , function(){

    var num = $(this).val();

    $(this).val( number_format(num) );

});


function number_format(num){


    var nStr = num + '';
    nStr = nStr.replace( /\,/g, "");
    var x = nStr.split( '.' );
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while ( rgx.test(x1) ) {
        x1 = x1.replace( rgx, '$1' + ',' + '$2' );
    }

    return x1 + x2 ;


}

function number(n){
    return Number($.trim(n.replace(/\,/g,'')));
}

function copyToClipboard(elem) {
    // create hidden text element, if it doesn't already exist
    var targetId = "_hiddenCopyText_";
    var isInput = elem.tagName === "INPUT" || elem.tagName === "TEXTAREA";
    var origSelectionStart, origSelectionEnd;
    if (isInput) {
        // can just use the original source element for the selection and copy
        target = elem;
        origSelectionStart = elem.selectionStart;
        origSelectionEnd = elem.selectionEnd;
    } else {
        // must use a temporary form element for the selection and copy
        target = document.getElementById(targetId);
        if (!target) {
            var target = document.createElement("textarea");
            target.style.position = "absolute";
            target.style.left = "-9999px";
            target.style.top = "0";
            target.id = targetId;
            document.body.appendChild(target);
        }
        target.textContent = elem.textContent;
    }
    // select the content
    var currentFocus = document.activeElement;
    target.focus();
    target.setSelectionRange(0, target.value.length);

    // copy the selection
    var succeed;
    try {
        succeed = document.execCommand("copy");
    } catch (e) {
        succeed = false;
    }
    // restore original focus
    if (currentFocus && typeof currentFocus.focus === "function") {
        currentFocus.focus();
    }

    if (isInput) {
        // restore prior selection
        elem.setSelectionRange(origSelectionStart, origSelectionEnd);
    } else {
        // clear temporary content
        target.textContent = "";
    }
    return succeed;
}


function navigate(url){
    document.location = url ;
}

$(document).on('change' , '.category-selector', function(){


    if($(this).parents('.category-wrapper').length < 1  )
        return ;


    let subcategory = $(this).parents('.category-wrapper').find('.subcategory-selector');
    let category = $(this);
    subcategory.html('');
    if(category.val() == 0) return ;


    category.attr('disabled' , true );
    subcategory.attr('disabled' , true );



    $.post(category.data('route') , csrf({id : category.val()}) , function(data){

        data = $.parseJSON(data);
        category.attr('disabled' , false );
        subcategory.attr('disabled' , false );

        if(data.stat == 'ok')
        {
            subcategory.html(data.html);
        }

    })

})


$(document).on('change' , '.province-selector' , function(){

    var city_selector = $(this).parents('.location-wrapper:first').find('.city-selector');
    var hood_selector = $(this).parents('.location-wrapper:first').find('.hood-selector');
    var province_selector = $(this);

    if(city_selector.length != 1  || province_selector.val() == 0 ) return ;


    province_selector.attr('disabled' , true );
    city_selector.attr('disabled' , true );

    if(  $('#auth-compelete-modal').length == 1 )
        $('#auth-compelete-modal').find('.province-selector').val($(this).val());

    $.post( province_selector.data('route'), csrf({id : province_selector.val()}) , function(data){
        province_selector.attr('disabled' , false  );
        city_selector.attr('disabled' , false );

        city_selector.html(data);
        hood_selector.html('<option value="0">انتخاب کنید</option>');

        if(  $('#auth-compelete-modal').length == 1 )
            $('#auth-compelete-modal').find('.city-selector').html(data);

    });
});

$(document).on('change' , '.city-selector' , function(){

    var hood_selector = $(this).parents('.location-wrapper:first').find('.hood-selector');
    var city_selector = $(this);

    if(hood_selector.length != 1  || city_selector.val() == 0 ) return ;


    hood_selector.attr('disabled' , true );
    city_selector.attr('disabled' , true );


    $.post( city_selector.data('route'), csrf({id : city_selector.val()}) , function(data){
        city_selector.attr('disabled' , false  );
        hood_selector.attr('disabled' , false );
        hood_selector.html(data);

    });
});
