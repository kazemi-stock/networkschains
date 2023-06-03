$(document).on('click' , '.uploader-reset' , function () {
	$(this).parents('.uploader-wrapper:first').find('.standard-upload-files').val('');
	$(this).parents('.uploader-wrapper:first').find('.preview').hide();
	$(this).parents('.uploader-wrapper:first').find('.uploader').show();
})


$(document).on('click' , '.upload-deleteable-btn' , function () {
	$(this).parents('.uploader-wrapper:first').remove();
})

$(document).on('click' , '.upload-undo' , function () {
	$(this).parents('.uploader-wrapper:first').find('.standard-upload-files').val('');
	$(this).parents('.uploader-wrapper:first').find('.preview').show();
	$(this).parents('.uploader-wrapper:first').find('.uploader').hide();
})
var config_object = {
		loader : '<div class="preview">'+
                                '<i class="file-icon glyphicon glyphicon-circle-arrow-up pull-right"></i>'+
                                   '<div class="progress">'+
'<div class="progress-bar progress-bar-striped progress-bar-danger active" role="progressbar" aria-valuenow="70"'+
                                 ' aria-valuemin="0" aria-valuemax="100" style="width:0%">0%</div>'+
                               ' </div>'+
                               '<br style="clear:both" /></div>',
		error:function(data){
			console.log(' ther was an error ');
		} ,
    };
	
var uploader_app = uploader_app || {} ;
var upload_object = {};

		$(document).on( "change" , ".standard-upload-files" ,  function(event) {
			
			event.preventDefault();  
			var standardUploadFiles = $(this).prop('files');
			var filename = $(this).val().split('\\').pop();
			let wrapper = $(this).parents('.uploader-wrapper:first') ;
			let prev  = $(this).parents('.uploader-wrapper:first') .find('.preview');
			let progress  = $(this).parents('.uploader-wrapper:first') .find('.progressbar').length == 1 ? $(this).parents('.uploader-wrapper:first') .find('.progressbar') : prev ;
			let uploader  = $(this).parents('.uploader-wrapper:first') .find('.uploader');
			wrapper.find('.table').remove();
			let updtemp = wrapper.html();
			uploader.hide();

			if(wrapper.hasClass('inline-uploader'))
			{
				progress.html(`
                                                            <div class="uk-grid">
                                                            
                                                            <div class="uk-width-expand">
																<progress   class="uk-progress progress-green uk-margin-small-bottom uk-margin-small-top" value="10" max="100" style="height: 8px;"></progress>
															</div>

			`).show();

			}
			else
			{
				progress.html(`
			                                                    <table class="table table-white uk-table uk-table-devider uk-table-white uk-table-right uk-table-bordered  no-header">
                                                        <tr>
                                                            <th>عنوان فایل</th>
                                                            <th> وضعیت</th>
                                                        </tr>
                                                        <tr>
                                                            <td> ${filename}</td>
                                                            <td class="status" width="70%"> 
                                                            <div class="uk-grid">
                                                            
                                                            <div class="uk-width-expand">
																<progress   class="uk-progress progress-green uk-margin-small-bottom uk-margin-small-top" value="10" max="100" style="height: 8px;"></progress>
															</div>
                                                            </div>
                                                            </td>
                                                        </tr>
                                                    </table>
			`).show();

			}



			let  config = {
						backend : $(this).data('route') ,
						callback : $(this).data('callback') || false  ,
						progressBar :  wrapper.find('.uk-progress') ,
						maxup       : 1 ,
						wrapper : wrapper ,
						updtemp:updtemp ,
						prev : prev ,
						uploader : uploader ,
				        progress : progress

			};


			 upload_file( standardUploadFiles ,config  );
		});
	
$(document).ready(function(e) {
 
		
 		// $(document).on( "dragover" , ".file-drop-zone" ,  function(event) {
		// 	event.preventDefault();
		// 	event.stopPropagation();
		//     $(this).addClass('file-hovered-zone');
		// });
		//
 		// $(document).on( "dragleave" , ".file-drop-zone" ,  function(event) {
		// 	event.preventDefault();
		// 	event.stopPropagation();
		// 	$(this).removeClass('file-hovered-zone');
		// });
		
  		// $(document).on( "drop" , ".file-drop-zone" ,  function(event) {
		// 	event.preventDefault();
		// 	event.stopPropagation();
        //     $(this).removeClass('file-hovered-zone');
		//
		// 	var config = {
		// 		   backend : $(this).attr('data-backend') ,
		// 		  uploaderid  : $(this).attr('data-uploaderid') ,
		// 		  progressBar :  $(this).parents('.upload-wrapper:first').find('.file-upload-preview') ,
		// 		  maxup       : $(this).attr('data-mu')
		// 		};
		//
		// 	upload_file(event.originalEvent.dataTransfer.files , config );
		// });
		//
$(document).on('click' , '.delete-upload' , function(data){
	
	 
	 var code =  $(this).attr('data-id');
	 var type =  $(this).attr('data-type');
	 var p    = $(this).parents('.preview:first');
	 
	 console.log( code +' --- >  '+type );
	 
	 if(p.hasClass('inprog'))
	  return false;
	  
	  $(this).fadeOut();
	      
	       type =  typeof(type) == 'undefined'  ? false :  type ;
		  
		  console.log(type);
		
		  var new_upload_oobject = {} ;
		  $.each(upload_object , function(i,arr)
		  {

			  var index = $.inArray(code, arr);
			  if(index > - 1 )
			  {
			     arr.splice(index, 1);
				 type = i ;
			  }
			  new_upload_oobject[i] = arr ;
			  
		  });
		  
		  upload_object = new_upload_oobject;
	
	  if(!type)  { p.remove(); return false; }
	 
	  p.addClass('inprog');
	  $.post( $(this).parents('.file-drop-zone:first').data('backend')+'/dropfile/'+type , { code:code  , _token:$('input[name=_token]').val()} , function(data){
          
		  
		  
		  p.remove();

		  
	  });
	 
	 

});

});

function upload_file(files , config ){
	config_object.files = files ;
	jQuery.extend(config_object, config);
	uploader_app.uploader(config_object);
}
		
		
		
(function(o){


	var ajax , getFormData , setProgress ;
	
	ajax = function(data){
		
		var _token = $('input[name=_token]').val();
		 
		 
		o.options.progressBar.append(o.options.loader);
	   
	   var pwraper = o.options.wrapper;
	   var preview = o.options.prev;
	   var uploader = o.options.uploader;
	   var pbar        = o.options.progressBar ;
	   var updtemp        = o.options.updtemp ;

		var xhr = new XMLHttpRequest();
		
		xhr.addEventListener('readystatechange' , function(){
			if(this.readyState === 4 )
			{
				if(this.status === 200 )
				{
					var data = $.parseJSON(this.response);
					if(data.stat == 'ok')
					{
						if(pwraper.find('.progressbar').length == 1 )
							pwraper.find('.progressbar').html('');

						if(data.render ==  'replace')
						{
							if(typeof data.replace_el != 'undefined'  )
							{
								pwraper.parents(`${data.replace_el}:first`).replaceWith(data.html);
							}
							else
							{
								preview.html(data.html);
								if(uploader.hasClass('show_after_upload'))
									uploader.show().find('input').val('');

							}

						}
						else
						{
							preview.html(`


							<table class="table table-white no-header success-upload"  data-token="${data.token}" data-type="image">
								<tbody><tr>
									<th></th>
									<th>عنوان</th>
									<th>ویرایش</th>
								</tr>
								<tr>
									<td> <img src="${data.preview}" style="max-width: 50px ; max-height: 50px"> </td>
									<td> ${data.file_name}</td>
									<td><a class="fas fa-edit uploader-reset"></a> </td>
								</tr>
							</tbody></table>
								`
							);
						}


						if(o.options.callback !== false )
						{
							var cb = eval(o.options.callback)
							if (typeof cb == 'function') {
								cb();
							}
						}


					}
					else
					{
						var error_msg = '';
						if($.isArray(data.msg) || $.isPlainObject(data.msg))
						{
						$.each(data.msg,function(k,v){
							error_msg += '<br />' + v ;
						})
						}
						else
						error_msg = data.msg;

						preview.html(`
						 			       <table class="table table-white no-header">
                                                        <tr>
                                                            <th>عنوان خطا</th>
                                                            <th> حذف</th>
                                                        </tr>
                                                        <tr>
                                                            <td> ${error_msg} </td>
                                                            <td> <a class="fas fa-window-close uploader-reset"  ></a> </td>
                                                        </tr>
                                                    </table>
`
						);


					}
				}
				else
				o.options.error();
			}
		});
		xhr.upload.addEventListener('progress' , function(event){
			
			var percent ; 
			if(event.lengthComputable === true )
			{
				percent = Math.round((event.loaded / event.total ) * 100 );
				console.log(percent);
 			//	pbar.attr('class', 'progalue value-'+percent);
				pbar.val( percent);
			}

		});
		
		
		
		xhr.open( 'post' , o.options.backend );
		xhr.setRequestHeader("X-CSRF-Token", _token);
		xhr.send(data);
  	};
	
	
	getFormData = function(source){

		
		$.each(source , function(i,v){
			
			var current = o.options.progressBar.find('.preview').length;
			
			if( typeof(upload_object[o.options.uploaderid]) != 'undefined' && 
			upload_object[o.options.uploaderid].length >= o.options.maxup)
			return false;
			
			
			if(  current  >= o.options.maxup ) return ;
			
			var data = new FormData();
			data.append('files' , v );
			ajax(data);
			
			
		});
 	};
	
	setProgress = function(data){
	};
	
	o.uploader = function(options){

		o.options = options ;
		 if(o.options.files !== undefined )
		{ 
			getFormData(o.options.files);
		}
	};
	
	
}(uploader_app));