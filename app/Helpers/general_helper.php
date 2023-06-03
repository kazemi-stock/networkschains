<?php


function send_sms($number , $text , $code = '14581'){

    ini_set("soap.wsdl_cache_enabled", "0");
    try {

        $client = new \SoapClient('http://api.payamak-panel.com/post/send.asmx?wsdl', array('encoding'=>'UTF-8'));
        $parameters =[] ;
        $parameters['username'] = "sarmayesh";
        $parameters['password'] = "8067";
        $parameters['to'] = $number;
        $parameters['text'] =$text;
        $parameters['bodyId'] = $code;
        return $client->SendByBaseNumber2($parameters);

    } catch (SoapFault $ex) {
        echo $ex->faultstring;
    }

}

function calc_percent($p , $total ){
    return (($p / 100) * $total ) ;
}




function set_browse_params($export , $params = []  ){

    $inject  = [] ;
    if(isset($export->category) && $export->category)
        $inject['category'] = "c:".$export->category->url;

    foreach ($params as $k=>$v )
    {
        $inject[$k] = $v ;
    }

    return ['params' => implode(',' , $inject)];

}

function button($params ){

    $tag = $params['tag'] ?? 'a'  ;
    $text = $params['text'] ?? 'ثبت'  ;

    $btn =  "<$tag ";
    foreach ($params['attr'] as $k=>$v)
        $btn .= " $k = '$v' ";

    $btn .= ">
     <span class='nospiner'>  $text</span>
        <div class='spinner-border   spiner' role='status' uk-spinner >
        </div>
    </$tag>";

    return $btn ;

}



function validate_date($date , $error = false ){

    $searhc_date = explode('-' ,  $date )  ;
    if(count($searhc_date) != 3 )
        jerror( $error ? $error : 'فرمت تاریخ ارسال شده صحیح نمیباشد' );

    return convert_date( $date , 'Y-m-d' , false );
}

function org_plan(){
    return [

        'r10' =>'بازه 10 خرید  ',
        'r30' =>'بازه 30 خرید  ',
        'r50' =>'بازه 50 خرید  ',
        'r100' =>'بازه 100 خرید  ',
        'r200' =>'بازه 200 خرید  ',
        'r300' =>'بازه 300 خرید  ',
        'r400' =>'بازه 400 خرید  ',
        'r500' =>'بازه 500 خرید  ',
        'r700' =>'بازه 700 خرید  ',
        'r1000' =>'بازه 1000 خرید  ',



    ];
}


function provinces(){


    return  DB::table('provinces')->orderBy('id' , 'asc')->get()->toArray();

}
function register_rules(){


    $rules =   DB::table('pages')->where('slug' ,'rules')->first();
    return $rules ? $rules->text : '' ;

}
function filter_types($k=0){

	$stat = array(
		'select'=> 'انتخاب گزینه ای' ,
		'range' => 'بازه عددی' ,
	);

	return $k > 0 ? $stat[$k] : $stat ;
}
function user_role($k=false ){

	$stat = array(
		'user'=> ' کاربر عادی' ,
		'agent' => 'مدیر بنگاه املاک' ,
		'employe' => 'کارمند املاک' ,
		'admin' => 'اپراتور' ,
		'superadmin' => 'مدیر کل' ,
	);

	return $k  ? $stat[$k] : $stat ;
}

function brows_url( $item , $stack ){
	$stack[$item[0]] = $item[1];
 return route('product_brows' , $stack);
}

function category_topmenu($parent_id = 0 , $category_stack = [] , $ul = ""  , $this_line=[]){

	if(empty($category_stack))
		$category_stack = DB::table('categories')->orderBy('id' , 'asc')->get();
	$this_struct  = [];
	foreach ($category_stack as $cs ) {
		if($cs->parent_id == $parent_id)
			$this_struct[] = $cs ;
	}
	if(empty($this_struct)) return '';

	$class = $parent_id == 0 ? '' : 'subcategory';
	$ul .= '<ul class="'.$class.'">';
	if($parent_id == 0 )
		$ul .='<li><a href="'.url('/').'"> <span>خانه</span> <i class="fa fa-home"></i></a></li>';
	foreach ($category_stack as $cs )
	{
		if($cs->parent_id != $parent_id) continue ;

		if($cs->parent_id == 0 )
			$this_line = [] ;

		$this_line[] = $cs->id;

		$icon = $parent_id ==0  ? '<i class="pull-right fa fa-angle-down" aria-hidden="true"></i>' : '<i class="pull-right fa fa-angle-left" aria-hidden="true"></i>';
		$href = route('product_brows').'/category-'.implode('-' , $this_line);
		$ul .= '<li class="category">'.$icon.'<span class="top-menue-item"><a href="'.$href.'"> '. $cs->title .' </a> </span>';
		$ul .= category_topmenu($cs->id , $category_stack ,'' , $this_line);
		$ul .="</li>";
	}
	$ul .= "</ul>";

	return $category_stack ;
}

function category_browsmenu($checkarray = [] , $parent_id = 0 , $category_stack = [] , $ul = "" ){

	if(empty($category_stack))
		$category_stack = DB::table('categories')->orderBy('id' , 'asc')->get();
	$this_struct  = [];
	foreach ($category_stack as $cs ) {
		if($cs->parent_id == $parent_id)
			$this_struct[] = $cs ;
	}
	if(empty($this_struct)) return '';

	$class = $parent_id == 0 ? 'sid-maincategory' : 'side-subcategory';
	$ul .= '<ul class="'.$class.'">';
	foreach ($category_stack as $cs )
	{
		if($cs->parent_id != $parent_id) continue ;
		$checked = in_array($cs->id, $checkarray ) ? 'checked="checked"' : '' ;


		$ul .= '<li class="side-category"><input type="checkbox" data-id="category" value="'.$cs->id.'" data-value="'.$cs->id.'" class="filter-option filter-ctegory" '.$checked.'> <span>'. $cs->title .'</span>';
		$ul .= category_browsmenu($checkarray , $cs->id , $category_stack );
		$ul .="</li>";
	}
	$ul .= "</ul>";

	return $ul ;
}


function category_brows_stack ( $parent_id = 0 , $stack = [] ,$table = 'categories' ){

 	if($parent_id == 0 )
	{
		$category_stack = DB::table( $table)->whereNull('parent_id')->orderBy('id' , 'asc')->get();
		$category_current = false ;
		$category_current_parent = false ;
	}
	else
	{
		$category_stack = DB::table($table)->where('parent_id' , $parent_id )->orderBy('id' , 'asc')->get();
		$category_current = DB::table($table)->find( $parent_id );
		$category_current_parent = DB::table($table)->find( $category_current->parent_id );
	}


	if($category_stack->isEmpty()) return $stack ;


	$stack[$parent_id] = ['g_parent'=> $category_current_parent ? $category_current_parent  : false , 'parent'=> $category_current ? $category_current  : false , 'child'=>[]];

	foreach ($category_stack as $cs )
	{
		$stack[$parent_id]['child'][] = $cs;
		$stack[$parent_id]['child_stack'][] = $cs->id ;
		$stack = category_brows_stack( $cs->id , $stack , $table );

	}

	return $stack ;

}

	function user_avatar( $user  ){

     return avatar_url($user);

	}
	function asset_url( $url ){
		return load_asset("assets/$url");
	}


	function upload_url( $url ){
		return asset_url("upload/$url");
	}

	function avatar_url( $user  ){

    if(!$user || !$user->avatar )
        return asset_url('image/avatar-default.png');
    else
        return upload_url("$user->avatar");

	}
function product_image( $image  , $absolut = true ){
	if(is_null($image))
		return asset_url('asset/img/product-default.png');
	else
		return  $absolut ? asset_url("images/$image") :  "./public/image/attach/$image";
}


	function load_asset($asset){
        if (strpos($_SERVER['HTTP_HOST'] , 'c0iner.com') !== false  || strpos($_SERVER['HTTP_HOST'] , 'c0iner.org') !== false  )
            return secure_asset($asset);
        else
            return asset($asset);
    }

function auction_off($auction){
	$price = $auction->original_price  ;
	if($auction->exp_type == 'bid')
	$base_price = $auction->base_price;
		else
	$base_price = (!is_null($auction->current_bid_price)) ?  $auction->current_bid_price : $auction->base_price;


	return intval( 100 - ($base_price / $auction->original_price) * 100 ).'%';
}

function open_auction(){
	return ['status'=>'active' , ['start_date' , '<=' , date('Y-m-d H:i:s')], ['end_date' , '>' , date('Y-m-d H:i:s')]];
}
	/**********************
	//// LOADER
	***********************/

		function loader( $parameters = array('class'=>'loader') , $style="display:none" ){
			$loder =  '<img src="'.base_url().'assets/images/loader.gif" ';
			if(!empty($parameters))
			foreach($parameters as $k=>$v)
			$loder .= $k.'="'.$v.'"';
			$loder .= ' style="'.$style.'" />';
			return $loder;
		}

	function empty_query( $txt = 'موردی پیدا نشد' ){
		return "<div class='alert alert-warning'> $txt </div>";
	}

function box_toggle_all(){
	return ' <a class="btn btn-danger btn-xs " onclick="$(\'.box-toggle-all\').trigger(\'click\')"> <input style="margin-right:10px;display: none;" type="checkbox" class="box-toggle-all">  <i class="glyphicon glyphicon-fullscreen"></i> </a>';
}

function category_slug( $parent , $child ){

	$parent = filter_array(explode('/' , $parent ));
	if(empty($parent))
		return $child;

	$parent[] = $child;
	return implode('/', $parent);
}

function category_product_slug( $parent , $child ){

	$parent = filter_array(explode('/' , $parent ));
	if(empty($parent))
		return $child;

	$parent[] = $child;
	$parent = filter_array( $parent );

	foreach($parent as $k=>$v)
	{
		$parent[$k] = "category-$v";
	}
	return implode('/', $parent);
}




function req_object( $obj , $request , $whitelist  ){

	foreach ($whitelist as $k=>$v )
	{
		if(isset($request[$k]) &&  $request[$k])
		$obj->$k =  $request[$k] ;
	}


	return $obj;
}

function jok( $data = array() ){

	$data = is_array($data) ? $data : array('msg'=>$data);
	echo json_encode(array('stat'=>'ok') + $data );
	exit;
}


function profile($user , $key ){

		    return $user->Profile ? $user->Profile->$key : '' ;

}
function jerror( $msg = '' , $whitelist = array()){

	if(is_object($msg))
	{
		$msg = $msg->messages()->messages();
		if(!empty($whitelist)) {
			foreach ($msg as $k => $v) {
				if (isset($whitelist[$k]))
                {


                    $msg[$k] = $v ;
//                    if(strpos($whitelist[$k]['title'] , '*' ) !== false )
//                        $msg[$k] = str_replace( '*' , '' , $whitelist[$k]['title']);
//                    else
//                        $msg[$k] = str_replace([$k , str_replace('_', ' ', $k)],$whitelist[$k]['title'],$v );

                }
			}
		}
	}

	echo json_encode(array('stat'=>'er' , 'msg'=>$msg));
	exit;
}


function apiError( $msg = '' , $whitelist = []){
	if(is_object($msg))
	{
		$msg = $msg->messages()->messages();
		if(!empty($whitelist)) {
			foreach ($msg as $k => $v) {

				if (isset($whitelist[$k]))
					$msg[$k] = str_replace([$k , str_replace('_' , ' ' , $k) ] ,$whitelist[$k]['title'],$v[0] );
			}
		}
	}


	return response()->json(['success'=>0 , 'error'=>1  , 'msg'=>$msg] , 200);
}

function apiOk( $data  = [] ){
	if(!isset($data['msg']))
		$data['msg'] = '' ;
	return response()->json(['success'=>1 , 'error'=>0 ] + $data  , 200);
}

function rule($arr ){
	foreach($arr as $k=>$v)
		$arr[$k] = $v['rule'];
	return $arr;
}

/**********************
//// url
 ***********************/

function prep_url(   $tbl ='' , $req , $id = 0 ){
	/*$regex = '/[^\da-z A-Z 0-9_\- ا ئ آ ب پ ت ث ج چ ح خ د ذ ر ز ژ س ش ص ض ط ظ ع غ ف ق ک گ ل م ن و ه ی]/i';
     $string = preg_replace($regex , ' ', $string);
     $string    = preg_replace('/\s+/', ' ',  $string );
     return str_replace(' '  , '-' ,  trim($string));*/

	$default = $slug =  str_slug(  trim($req['slug']) == '' ?  $req['title'] : $req['slug']);
//
//	$ctr = 0 ;
//	while( DB::table($tbl)->where('slug' , $slug)->where('id' , '!=' , $id )->first() )
//	{
//		$ctr++;
//		$slug = $default.$ctr;
//	}
	return $slug;

}




function category_line(  $parent_id = 0  , $table = 'categories'){

	$line = array();
	while($parent_id >= 0 ) {
		$obj = DB::table( $table )->where('id' , $parent_id )->first();
		if(!$obj) break;
		$parent_id =  $obj->parent_id  ;
		$line[$obj->id] = $obj ;
	}
	return $line ;
}

function category_children(  $parent_id , $stack = []  ){

	$obj = DB::table('categories')->where('parent_id' , $parent_id )->get();
	foreach($obj as $o ) {

		$stack[$o->id] = $o->id ;
		$stack = category_children($o->id , $stack );
	}
	return $stack ;
}


function category_struct(  $parent_id = 0  ){

	$data = array();
	$map  = [];
	$all = DB::table('categories')->orderBy('parent_id' , 'asc')->get();
	foreach($all as $a )
	{
		$map[$a->parent_id][] = $a ;
	}

	if(isset($map[0]))
	foreach($map[0] as $m )
	{
		$space = '';
		$data = category_tree_($data, $map, $m , $space );
	}
	return $data;


}
function category_tree_( $data , $map , $m  , $spcae  ){

	$data[$m->id] = $spcae.$m->title  ;

	if(isset($map[$m->id]))
	foreach($map[$m->id] as $child )
	{
		$spcae .= '-';
		$data = category_tree_($data, $map, $child , $spcae);
	}
	return $data ;

}



function ck_js(){
	return " <script src='https://cdn.ckeditor.com/4.5.10/full/ckeditor.js'></script>";
}

function ck( $id ){
	return "<script>CKEDITOR.replace( '$id' );CKEDITOR.config.contentsLangDirection = 'rtl';</script>";
}


function box_btn(){
	return '<a class="btn btn-xs btn-default pull-left box-toggle-btn"><i class="glyphicon glyphicon-fullscreen"></i> </a>';
}


function delete_btn (  $id = 0 , $route = '' ){
	return '<a  href="javascript:void(0)" class="destroy-item-btn btn btn-danger" data-id="'.$id.'"  data-route="'.$route.'"> حذف</a> ';
}

function edit_btn ( $link = ''  , $inpage = 0  ){
	if($inpage == 1 )
		return '<a  href="javascript:void(0)"  class="edit-item-btn" onclick="$(\'#'.$link.'\').toggle()" ><i class="glyphicon glyphicon-edit tool_icon" style="color:green"></i></a> ';
	else
		return '<a class="btn btn-primary"  href="'.$link.'" >ویرایش</a> ';
}

function confirm_btn( $id , $link , $currrent_confirm = 0   ){
	if($currrent_confirm == 1 )
		return '<i class="glyphicon glyphicon-ok" style="color:green"></i>';
	else
		return '<a class="btn btn-green confirm-item-btn" style="color:white" data-id="'.$id.'" data-route="'.$link.'" data-loading-text=" .... "> تایید </a>';
}


function show_btn ( $link = ''  , $ajaxload = 0  ){

		return '<a  href="'.$link.'" ><i class="glyphicon glyphicon-eye-open tool_icon" style="color:#0095FF"></i></a> ';
}

function label( $text ='' , $clas = 'danger'){
	return "<span class='label label-sm label-$clas'> $text </span>";
}

function order_status( $key = false ){

	$levels = [

		1 => 'فعال',
		2 => 'انجام شده',
		3 => 'لغو شده'
	];

	if($key === false )
		return $levels;
	else if(is_numeric($key))
	{
		$class = [

			1 => 'dark',
			2 => 'success',
			3 => 'danger'
		];

		return '<span class="badge badge-'.$class[$key].'"> '.$levels[$key].'</span>';
	}
	//return $levels[$key];
}
function transaction_type( $tr ){

    if($tr->type == 'buy_course')
    {

        return  ' خرید دوره آنلاین : '. $tr->TransactionCourse->Course->title ;
    }

    if($tr->type == 'buy_seminar')
    {
        return ' خرید سمینار : '.$tr->TransactionSeminar->Seminar->title ;
    }

    if($tr->type == 'buy_quiz')
    {
        return ' خرید آزمون : '.$tr->TransactionQuiz->Quiz->title ;

    }
    if($tr->type == 'buy_consultant')
    {
        return ' خرید مشاوره : '.$tr->TransactionConsultant->Consultant->title ;

    }
    if($tr->type == 'buy_channel')
    {
        return ' خرید کانال آموزشی : '.$tr->TransactionChannel->Channel->title ;

    }

}

function setting($stack , $key , $default = '' ){

    return isset( $stack[$key]) ? $stack[$key] : $default ;

}


function wishlist( $wishlist ){


    if($wishlist->type == 'consultant' && $wishlist->WishlistConsultant && $wishlist->WishlistConsultant->Consultant )
    {
         return (object)[
            'title'=>$wishlist->WishlistConsultant->Consultant->title ,
            'link'=>$wishlist->WishlistConsultant->Consultant->image,
            'image'=>route('consultant_show' , ['url'=>$wishlist->WishlistConsultant->Consultant->image]) ,
        ];
    }

    if($wishlist->type == 'course' && $wishlist->WishlistCourse && $wishlist->WishlistCourse->Course )
    {
         return (object)[
            'title'=>$wishlist->WishlistCourse->Course->title ,
            'link'=>route('course_show' , ['url'=>$wishlist->WishlistCourse->Course->url]) ,
            'image'=>$wishlist->WishlistCourse->Course->image ,
        ];
    }

    if($wishlist->type == 'quiz' && $wishlist->WishlistQuiz && $wishlist->WishlistQuiz->Quiz )
    {
         return (object)[
            'title'=>$wishlist->WishlistQuiz->Quiz->title ,
            'link'=>route('quiz_show' , ['url'=>$wishlist->WishlistQuiz->Quiz->url]) ,
            'image'=>$wishlist->WishlistQuiz->Quiz->image ,
        ];
    }

    if($wishlist->type == 'channel' && $wishlist->WishlistChannel && $wishlist->WishlistChannel->Channel )
    {
         return (object)[
            'title'=>$wishlist->WishlistChannel->Channel->title ,
            'link'=>route('channel_view' , ['url'=>$wishlist->WishlistChannel->Channel->url]) ,
            'image'=>$wishlist->WishlistChannel->Channel->image ,
        ];
    }

    return false ;




}
function plans ( $key = false ){
	$levels = [
		'normal' => 'فروش معمولی' ,
		'off' => 'تخفیف' ,
		'wonder'=>'پیشنهاد شگفت انگیز'
	];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			'normal' => 'label-info' ,
			'off' => 'label-warning' ,
			'wonder'=>'label-success'
		];

		return '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>';
	}
	//return $levels[$key];
}

function order_types ( $key = false ){
	$levels = [
		'product' => 'فروش معمولی' ,
	];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			'product'=>'label-success'
		];

		return '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>';
	}
}

function settled ( $key = false ){
	$levels = [
		0 => 'پرداخت نشده' ,
		1 => 'پرداخت شده' ,
	];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			0=>'label-danger' ,
			1=>'label-success' ,
		];

		return '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>';
	}
}


function payment_method ( $key = false , $show_monthly = true ){
	$levels = [
		'online' => 'آنلاین' ,
		'cash' => 'نقد - حضوری' ,
	];

	if($show_monthly)
		$levels['monthly']  = 'تسویه در پایان ماه';

	if($key === false )
		return $levels;
	else
	{
		$class = [
			'online' => 'label-info' ,
			'cash' => 'label-warning' ,
			'monthly' => 'label-success' ,
		];

		return '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>';
	}
}



function withdraw_status ( $key = false , $raw = false  ){
	$levels = [
		0 => 'واریز نشده' ,
		1=> 'در حال بررسی' ,
		2=> 'واریز شد' ,
	];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			0 => 'label-danger' ,
			1 => 'label-warning' ,
			2 => 'label-success' ,
		];
		//if(!isset($class[$key]) || !isset($levels[$key]))
		//dd($key);
		if(! isset($levels[$key]))
			return '';

		return $raw ? $levels[$key] :  '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>' ;
	}
}

function auction_exp_type ( $key = false , $raw = false  ){
	$levels = [
		'date' => 'تاریخ' ,
		'bid'=> 'تعداد بید' ,
	];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			0 => 'label-info' ,
			1 => 'label-warning' ,
		];
		//if(!isset($class[$key]) || !isset($levels[$key]))
		//dd($key);
		if(! isset($levels[$key]))
			return '';

		return $raw ? $levels[$key] :  '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>' ;
	}
}

function delivery_date_type ( $key = false ){
	$levels = [
		'default' => 'اولین فرصت' ,
		'custom' => 'ارسال در زمان خاص' ,
	];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			'default' => 'label-info' ,
			'custom' => 'label-warning' ,
		];

		return '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>';
	}
}
function user_status ( $user = false , $output = 'html' ){
	$status = ['unactivated'=>'غیر فعال' , 'active'=>'فعال' , 'banned'=>'اخراجی'];

	if($user === false )
		return $status;
	else
	{
		if($user->account_banned == 1 )
		{
			$key = 'banned';
		}
		elseif($user->account_activated == 0 )
		{
			$key = 'unactivated';
		}
		else
		{
			$key = 'active';
		}

		if($output == 'html')
		{
			$class = [
				'banned' => 'label-danger' ,
				'active' => 'label-success' ,
				'unactivated' => 'label-warning' ,
			];
			return '<span class="label label-sm '.$class[$key].'"> '.$status[$key].'</span>';
		}
		else
		{
			return $key ;
		}
	}
}
function archived_status ( $key = false ){

	$levels = [
		0 => 'آرشیو نشده' ,
		1 => 'آرشیو شده' ,
	];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			0 => 'label-warning' ,
			1 => 'label-success' ,
		];
		return '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>';
	}
}

function in_betwee($needle , $stack )
{

	if(count($stack) == 1 )
	{
		if($needle == $stack[0]  )
			return true ;
		else
			return false;

	}
	else
	{
		if($needle >= $stack[0] && $needle <= $stack[1] )
			return true ;
		else
			return false;
	}

	return false;
}

function product_price ( $product  ){
	if(!$product->CurrentPlan)
	return 'موجود نیست';
		else
	return number_format($product->CurrentPlan->price) . currency();
}



function image_url( $image  , $absolut = true ){
	if(is_null($image))
		return  asset("/image/attach/unknown-default.jpg");
	else
		return  $absolut ? asset("/image/attach/$image") :  "./image/attach/$image";
}


function row( $k ){
  $page = isset($_GET['page'] ) && intval($_GET['page']) > 0  ? intval($_GET['page']) : 1  ;
	$add = ( $page - 1 ) * 15 ;
	return  ( $k+1 )  + $add  ;
}





function array_in_array($arr_base  ,  $arr_cond ){

	foreach($arr_base as $k=>$v)
	{
		if(!in_array(trim($v) , $arr_cond , true ))
			unset($arr_base[$k]);
	}

	return $arr_base;
}

function ft( $f , $t ){
	$y = array();
	for($i = $f  ; $i <= $t ; $i++)
		$y[$i] = $i ;

	return $y ;
}

function jest($text){

	return mb_substr( strip_tags($text), 0, 100) .' ... ';
}
function user_levels(){
	return [
		'none'=>'معمولی' ,
		'silver' => 'نقره ای' ,
		'gold' => 'طلایی' ,
		'pink' => 'صورتی'

	];
}
function userLevel($user , $levels = false  )
{
	$user_level_slug = 'none';
	if( ! $levels )
		$levels  = DB::table('user_levels')->get();

	$userLevels = [] ;
	foreach($levels as $l )
	{
		$userLevels[$l->slug] = $l ;
		if($l->slug == 'none' || $l->slug == 'spc')
			continue;

		if(
			($l->cond_transaction !== NULL  && $user->creditor >=  $l->cond_transaction ) ||
			($l->cond_points !== NULL  && $user->points  >= $l->cond_points ) ||
			($l->cond_refers !== NULL  &&  $user->stat_refers >=  $l->cond_refers) ||
			($l->cond_charg !== NULL  &&   $user->credit >=  $l->cond_charg)
		)
		{
			$user_level_slug = $l->slug;
		}
	}

	$user_level = isset($userLevels[$user_level_slug]) ? $userLevels[$user_level_slug] : false ;

	return $user_level;
}


function timing_types( $key = false )
{
	$levels = [
		'time' => 'بازه ساعتی مشخص در همه روز ها' ,
		'weekday' => 'یک روز مشخص در هفته' ,
		'date' => 'یک تاریخ مشخص',
	];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			'time'=> 'label-warning' ,
			'weekday' => 'label-success' ,
			'date' => 'label-danger' ,
		];
		return '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>';
	}
}


function discount_type( $key = false )
{
	$levels = [
		'code' => 'کد تخفیف' ,
		'ref' => 'تخفیف معرف' ,
		'custom' => 'تخفیف ویژه',
		'monthly' => 'تخفیف ماهیانه',

	];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			'code'=> 'label-warning' ,
			'ref' => 'label-success' ,
			'custom' => 'label-danger' ,
			'monthly' => 'label-info' ,
		];
		return '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>';
	}
}



function setting_purchase_inputype( $key = false )
{
	$levels = ['purchase_limit'=>'سقف خرید' , 'post_price'=>'هزینه ارسال' , 'both'=>'هر دو'];

	if($key === false )
		return $levels;
	else
	{
		$class = [
			'purchase_limit'=> 'label-primary' ,
			'post_price' => 'label-info' ,
			'both' => 'label-default' ,
		];
		return '<span class="label label-sm '.$class[$key].'"> '.$levels[$key].'</span>';
	}
}



function weekday($key = false ){


	$days = array(
		'يكشنبه',
		'دوشنبه',
		'سه شنبه',
		'چهارشنبه',
		'پنجشنبه',
		'جمعه',
		'شنبه',
	);

	if($key === false )
		return $days ;
	else
		return $days[$key];


}

function image($image)
{
	if( is_null($image) )
		return asset( '/public/images/default.jpg');
	else
		return asset( "/public/image/attach/$image");
}


/**********************

 *
 * --------------------------------- delete line !!
 *
/**********************
	//// GET ARRAY
	***********************/


	function getArray($tbl  ,$cond = array() , $k = 'id' , $v = 'title' , $order = array('id'=>'desc') ){

        $CI =& get_instance();
		$CI->load->model('mdb');
		$obj = $CI->mdb->get($tbl ,  $cond , false ,0,0, $order );
		if(!$obj) return array();

		$a = array();
		foreach($obj->result() as $o )
		{
		   if(is_array($v))
		   {
			   $val = array();
			   if(in_array( 'JOINE' , $v))
			   {
				   $J = array();
				   foreach($v as $vv)
				   {
					 if($vv == 'JOINE' ) continue;
 				     $J[] = $o->$vv;
				   }

 				   $a[$o->$k] =  implode('-' , $J);
			   }
			   else
			   {
				   foreach($v as $vv)
				   $val[$vv] = $o->$vv;

				   $a[$o->$k] = $val  ;
			   }
		   }
		   else
		   $a[$o->$k] = $o->$v  ;
		}
		return $a ;
	}

	/**********************
	//// filter array
	***********************/

	function filter_array($arr ,  $filter = array('' , FALSE  , 0  , '0' , 'null' , null , NULL )){

		foreach($arr as $k=>$v)
		{
			if(in_array(trim($v) , $filter , true ))
			unset($arr[$k]);
			else
			$arr[$k] = trim($v);
		}

		return $arr;
	}

	function years(){
		$y = array();
		for($i = 1350 ; $i < 1394 ; $i++)
		$y[$i] = $i ;

		return $y ;
	}

	function porsant( $request , $key , $amount )
    {
        $porsant_setting = isset( $request->attributes->get('global_setting')[$key] ) && is_numeric( $request->attributes->get('global_setting')[$key] ) ?  $request->attributes->get('global_setting')[$key]  : 0 ;

        $porsant   = ($porsant_setting / 100) * $amount;


        return [$porsant , $amount - $porsant] ;


    }




	function yn(){
		return array( 1 => 'بله' , 2 => 'خیر' );
	}


	function education(){
		return array('none'=>'بیسواد'  , 'cycle'=>'سیکل', 'diplom'=>'دیپلم' , 'fdiplom'=>'فوق دیپلم', 'lis'=>'لیسانس' , 'folis'=>'فوق لیسانس' , 'doctor'=>'دکترا');
	}


	function job_position(){
		return array('employe'=>'کارمند' , 'worker'=>'کارگر' , 'md'=>'مدیر' , 'karshenas'=>'کارشناس' , 'sarparast'=>'سرپرست' , 'smd'=>'مدیرعامل' , 'boss'=>'رئیس'  , 'none'=>'هیچکدام');
	}



	function membership_pay_type(){
		return array('cart'=>'کارت فروشی ' , 'gift'=>'هدیه' , 'tt'=>'تهاتو' );
	}

	function family(){
		return array('پدر'=>'پدر ' , 'مادر'=>'مادر' , 'برادر'=>'برادر'  , 'خواهر'=>'خواهر' , 'فرزند'=>'فرزند' , 'همسر'=>'همسر ' );
	}

	function military_service($k=false){
		$data =  array(1=>'نرفته' , 2 => 'درحال خدمت' , 3=>'پایان خدمت' , 4=>'معاف');
        if($k)
        {
            if(isset($data[$k]))
                return $data[$k];
            else
                return '' ;
        }
        else
            return $data ;

    }

	function cart_level(){
		return array('1'=>'برنزی' , '2'=>'نقره ای' , '3'=>'طلایی' , 4=>'ملت کارت خاص ');
	}

	function gender( $key = false ){
		$data = array('1'=>'مرد' , '2'=>'زن' );
		if($key === false )
		return $data ;
		else
			return isset( $data[$key])  ?  $data[$key] : '';
	}

	function marriage( $k = false ){
		$data =  array('1'=>'مجرد' , '2'=>'متاهل' );
		if($k)
        {
            if(isset($data[$k]))
                return $data[$k];
            else
                return '' ;
        }
		else
		    return $data ;

	}

	function ad_places(){
		return array('top'=>'بالا' , 'bottom'=>'پایین' , 'right'=>'راست' , 'left'=>'چپ' );
	}
	function ad_type(){
		return array('date'=>'ماهیانه' , 'click'=>'کلیکی' , 'view'=>'بازدید'  );
	}
	function socials(){
		return array('viber'=>'وایبر' , 'whatsapp'=>'واتس اپ' , 'telegram'=>'تلگرام'  );
	}
	/**********************
	//// get pannel sports
	***********************/

	function secondsTodetail($ss)
	{
		$data['s'] = $ss%60;
		$data['m'] = floor(($ss%3600)/60);
		$data['h'] = floor(($ss%86400)/3600);
		$data['d'] = floor(($ss%2592000)/86400);
		$data['M'] = floor($ss/2592000);

		return $data;
	}


	/**********************
	//// get pannel sports
	***********************/


	function ukselect( $data = array() , $name = 'select'  , $choosen = 0 , $default = 1  ,$def_text = 'انتخاب کنید' , $label  = 'title'){
	    return '<div uk-form-custom="target: > * > span:first-child" class="uk-form-custom uk-width-1-1">
'.select($data , $name   , $choosen , $default ,$def_text , $label).'

        <button class="uk-button uk-button-white d2w uk-width-1-1 uk-text-right" type="button" tabindex="-1" style="background-color: white ">
        <span>انتخاب کنید...</span>
        <span uk-icon="icon: chevron-down" class="uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="chevron-down"><polyline fill="none" stroke="#000" stroke-width="1.03" points="16 7 10 13 4 7"></polyline></svg></span>
        </button>
        </div>
        ';
    }
	function select( $data = array() , $name = 'select'  , $choosen = 0 , $default = 1  ,$def_text = 'انتخاب کنید' , $label  = 'title'){

		if(!is_array($name))
		$s = '<select name="'.$name.'" class="uk-select uk-form-large-wa '.$name.'" >';
		else
		{
			$s = '<select ';
			foreach($name as $k=>$v)
			{
				if($k == 'class' && !is_numeric('form-control'))
					$v = $v.' uk-select uk-form-large-wa   form-control';
			   $s .= " $k='$v' ";
			   if( $k == 'id' && !in_array('name' , $name ))
			   $s .= " name='$v'  ";
			}

			if(!isset($name['class']))
				$s .= " class='uk-select uk-form-large-wa  form-control' ";

			$s .= '>';
		}

// نوع آیتم

		if($default == 1   )
		{
		   $default_selected = is_numeric($choosen) && $choosen === 0 ? 'selected="selected"' : '' ;
		  $s .= '<option value="0" '.$default_selected.'>'.$def_text.'</opttion>';
		}
		foreach($data as $k=>$v )
		{
			if(is_object($v))
			{
				$k = $v->id ;
				$v = $v->$label;
			}
			if(is_numeric($choosen) && is_numeric($k))
			 $selected = ($k == $choosen )? 'selected="selected"' : '';
			else
			 $selected = ($k === $choosen )? 'selected="selected"' : '';
			$s .= '<option value="'.$k.'" '.$selected.'  > '.$v.' </option>';
		}
		$s .= '</select >';



		return $s ;
	}



	/**********************
	//// get pannel sports
	***********************/



	function checkbox( $data = array() , $name = 'checkbox'  , $choosen = array() ){

		$s = '<ul class="checkboxUl">';
		foreach($data as $k=>$v )
		{
			 $selected = in_array($k ,  $choosen) ? 'checked="checked"' : '';
			 $s .= '<li><input name="'.$name.'[]" class="'.$name.'" type="checkbox" value="'.$k.'"  '.$selected.'  />'.$v.'</li>';
		}
		$s .= '</ul>';
		return $s ;
	}



	/**********************
	//// get pannel sports
	***********************/


	function hash_pass($pass)
	{
		return sha1($pass);
	}


	/**********************
	//// price
	***********************/

	function get($tbl , $cond = array() , $row = false  ){


         $CI =& get_instance();
         return $CI->mdb->get($tbl ,  $cond , $row );
	}




	function prep_tags($post_tags , $add_comma = true , $return = 'text'   ){

		if(!is_array($post_tags))
		$post_tags = explode(',', $post_tags) ;

		$tags = array();
		foreach($post_tags as $t)
		{
			if(trim($t) == '' || trim($t) == ',' || in_array($t , $tags) ) continue ;
			$tags[] = trim($t);
		}

		if($return == 'array')
		return $tags ;


		if( empty( $tags) ) return '';

		return $add_comma ?  ','.implode(',' , $tags).',' : implode(' , ' , $tags);

	}

	/**********************
	//// date convert
	***********************/


	function convert_date($date , $format = 'Y-m-d H:i:s' , $time = true , $seperator = '-' ){

        error_reporting(0);
		$dt = array();

		if($time)
			list($date , $time) = explode(' ', $date);

		list($dt['y'] , $dt['m'] , $dt['d'] ) = explode($seperator , trim($date));

		if($time)
		list($dt['h'] , $dt['mm'] , $dt['s'] ) = explode(':' , $time);
		else
		$dt = $dt  + array('h'=>12 , 'mm'=>12 , 's'=>12 );

		$t = jmaketime( (int)$dt['h'] , (int)$dt['mm']  , (int)$dt['s'] , (int)$dt['m'] , (int) $dt['d'] ,  (int) $dt['y'] );
		return  date($format  , $t  );
	}

	/**********************
	//// upload path
	***********************/
   function partner_image($p  ,$thumb = false)
   {
	   if( is_null($p->pic) )
	   return img_url().'default.jpg';

	   if($thumb)
	   return image_url().'thumb_'.$p->pic ;
	   else
	   return  image_url().$p->pic ;
   }



	/**********************
	//// form generator
	***********************/


	function form_inline( $filds = array()  , $form = array('method'=>'post' , 'action'=>'') , $btn = array('title'=>'جستجو' , 'class'=>'btn-primary') ){


	echo '<form class="form-inline" method="'.$form['method'].'" action="'.$form['action'].'">';

	  foreach($filds as $k=>$v)
	  {
		echo '<div class="form-group">';
			echo '<label for="exampleInputName2">'.$v.'</label>';
			echo '<input type="text" class="form-control" name="'.$k.'" id="form_'.$k.'" placeholder="">';
		echo '</div>';
	  }



   echo '<button type="submit" class="btn '.$btn['class'].'">'.$btn['title'].'</button>';
   echo '</form>';

	}



	function btn ( $link = ''  , $inpage = 0  , $icon = 'glyphicon glyphicon-edit' , $func = 'edit_inpage' , $class= ''){
		if($inpage == 1 )
		return '<a class="'.$class.'"  href="javascript:void(0)" onclick="'.$func.'(\''.$link.'\');" ><i class="'.$icon.' tool_icon" style="color:green"></i></a> ';
		else
		return '<a class="'.$class.'"  href="'.$link.'" ><i class="'.$icon.' tool_icon" style="color:green"></i></a> ';
	}


	function site_items( $k = false ){

	    $items =  [
            'all' => 'همه' ,
	        'course' => 'آموزش آنلاین' ,
	        'seminar' => 'سمینار/کلاس/همایش' ,
	        'channel' => 'کانال آموزشی' ,
	        'consultant' => 'مشاوره' ,
	        'quiz' => 'آزمون' ,
	        'product' => 'محصول' ,
        ] ;

	    if($k !== false )
        {
            return isset($items[$k]) ? $items[$k] : '-';
        }

	    return $items ;

    }

	function notifications( $not ){


	    if($not->type == 'course_discussion_init')
        {
             return '<a href="'.route('course_discussion' ,['id'=>$not->reference_id  ,'disc'=>$not->obj_id]).'">  '.$not->text.' </a>';
        }
	    if($not->type == 'quiz_discussion_init')
        {
            return '<a href="'.route('quiz_discussion' ,['id'=>$not->reference_id  ,'disc'=>$not->obj_id]).'">  '.$not->text.' </a>';
        }
	    if($not->type == 'consultant_discussion_init')
        {
            return '<a href="'.route('consultant_discussion' ,['id'=>$not->reference_id  ,'disc'=>$not->obj_id]).'">  '.$not->text.' </a>';
        }
	    if($not->type == 'seminar_discussion_init')
        {
            return '<a href="'.route('seminar_discussion' ,['id'=>$not->reference_id  ,'disc'=>$not->obj_id]).'">  '.$not->text.' </a>';
        }


	    if($not->type == 'course_discussion_response')
        {
            return '<a href="'.route('course_show' ,['id'=>$not->reference_id  ,'disc'=>$not->obj_id]).'">  '.$not->text.' </a>';
        }
	    if($not->type == 'quiz_discussion_response')
        {
            return '<a href="'.route('quiz_show' ,['id'=>$not->reference_id  ,'disc'=>$not->obj_id]).'">  '.$not->text.' </a>';
        }
	    if($not->type == 'seminar_discussion_response')
        {
            return '<a href="'.route('seminar_show' ,['id'=>$not->reference_id  ,'disc'=>$not->obj_id]).'">  '.$not->text.' </a>';
        }
	    if($not->type == 'consultant_discussion_response')
        {
            return '<a href="'.route('consultant_show' ,['id'=>$not->reference_id  ,'disc'=>$not->obj_id]).'">  '.$not->text.' </a>';
        }
    }

	function notifobject( $object , $key ){

	    $object = json_decode($object);
	    return isset($object->$key) ? $object->$key : '' ;

    }

    function ad_code($ad  , $root = true  ){


	    if(isset($ad->title))
	        return 'K' . $ad->id ;

	        return mb_strtoupper($ad->type) .'-' .$ad->Room->code . $ad->id ;
    }


    function credit_type( $credit ){
        if($credit->type == 'fish')
        {
            $text = 'فیش بانکی #';
            if(isset($credit->UserCreditFish->trace_code))
                $text .=  $credit->UserCreditFish->trace_code ;
        }
        if($credit->type == 'porsant')
        {
            $text = 'پورسانت معرفی ';
        }

        else if($credit->type == 'transaction')
        {
            $text = 'پرداخت برای فاکتور شماره #';
            if(isset($credit->TransactionCredit->Transaction->invoice_id))
            $text .=  $credit->TransactionCredit->Transaction->invoice_id ;

        }
        elseif($credit->type == 'deposit_free')
        {
           $text = 'آزاد شدن سپرده گذاری  ترید شماره # ' ;
           $text .= $credit->UserCreditDepositFree ? $credit->UserCreditDepositFree->trade_id   : ' ';

        }
        elseif($credit->type == 'trade_cancel')
        {
           $text = 'کنسل شدن  ترید شماره # ' ;
           $text .= $credit->UserCreditTradeCanel->trade_id  ;

        }
        elseif($credit->type == 'withdraw')
        {
          $text = 'درخواست تصویه شماره # ' ;
          $text .= $credit->credit_id  ;
        }
        elseif($credit->type == 'withdraw_cancel')
        {
          $text = ' کنسل شدن درخواست تصویه شماره # ' ;
          $text .= $credit->credit_id  ;

        }
        elseif($credit->type == 'custom')
        {
           $text = 'واریز دستی توسط مدیریت' ;
        }

        else
          $text = $credit->type ;

        return $text ;

    }

    function telegram_robot_code(){
	    return '562302190:AAFPgq1hql_kf0wFASAhMlvAd_Wv-83sDXw';
    }

    function user_online($user){
	    if($user->activity_at > strtotime("-5 minutes"))
	        return 'user-online';
	    else
	        return 'user-offline';
    }

    function notification_types($type){
	    if($type =='trade')
	        return ['offer_reject'  , 'offer_accepted' , 'offer_created'  , 'trade_created' ,'trade_confirm' , 'trade_score' ];
	   else if($type =='talk')
	        return ['ticket' ,'plea_create' , 'plea_dialog' ,'plea_result' ];
       else if($type =='finance')
	        return ['withdraw_response' ,'invoice_created' , 'trade_coin_delivery' , 'trade_payment_done'];
       else return [] ;
    }


    function notification_text($notification){


        if($notification->type == 'offer_created')
                            return 'پیشنهاد جدید برای آگهی  '.notifobject($notification->obj , 'ad_code').' دریافت شد ';
                        elseif( $notification->type == 'offer_accepted' )
        return 'پیشنهاد شما برای آگهی شماره '.notifobject($notification->obj , 'ad_id').' مورد قبول قرار گرفت ';

                        elseif( $notification->type == 'offer_reject' )
        return 'پیشنهاد شما برای آگهی شماره '.notifobject($notification->obj , 'ad_code').' رد شد ';


                        elseif( $notification->type == 'invoice_created' )
        return ' فاکتور شماره '.notifobject($notification->obj , 'invoice_id').'  برای شما ایجاد شد ';
                        elseif( $notification->type == 'trade_payment_done' )
        return '

            سپرده گذاری  برای ترید شناسه
                                '.notifobject($notification->obj , 'trade_id').' ('.notifobject($notification->obj , 'ad_code').')
                                ایجاد شد لطفا نسبت به انتقال ارز به حساب خریدار اقدام فرمایید ';
        elseif( $notification->type == 'trade_coin_delivery' )
        return '

            کوین در ترید شناسه
                                '.notifobject($notification->obj , 'trade_id').' ('.notifobject($notification->obj , 'ad_code').' )

                                به والت شما منتقل شد لطفا نسبت به تایید ترید اقدام کنید ';
        elseif( $notification->type == 'trade_created' )
        return '
            ترید جدیدی با  شماره
                                '.notifobject($notification->obj , 'trade_id').'
                                برای آگهی
                                 '.notifobject($notification->obj , 'ad_code').'
                                ایجاد شد

        ';

        elseif( $notification->type == 'trade_confirm' )
        return ' ترید  با  شناسه
                                '.notifobject($notification->obj , 'trade_id').' ('.notifobject($notification->obj , 'ad_code').')

                                توسط خریدار تایید شد  ';
        elseif( $notification->type == 'trade_score' )
        return ' امتیاز شما برای ترید با  شناسه
                                '.notifobject($notification->obj , 'trade_id').' ( '.notifobject($notification->obj , 'ad_code').')

                                ثبت شد  ';

        elseif( $notification->type == 'ticket' )
        return ' شما یک پیام جدید دارید  ';
        elseif( $notification->type == 'withdraw_response' )
        return ' درخواست تسویه شما پاسخ داده شد   ';

        elseif( $notification->type == 'plea_create' )
        return ' یک درخواست داوری جدید بر علیه شما ایجاد شد  ';

        elseif( $notification->type == 'plea_dialog' )
        return ' یک پیام جدید در درخواست داوری ارسال شد  ';
        elseif( $notification->type == 'plea_result' )
        return ' نتیجه درخواست داوری اعلام شد   ';


    }

    function course_compelete_progress( $course ){

	    if($course->Section->isEmpty())
        {
            $lectures = 0 ;
        }
	    else
        {
            $total_sections = count($course->Section) ;
            $total_lectures = 0 ;
            foreach ($course->Section as $section )
            {
                if(!$section->Lecture->isEmpty())
                {
                    $lecture_compelete = true ;

                    foreach ($section->Lecture as $lecture )
                    {
                        if(($lecture->type =='video' && $lecture->Video ) || ($lecture->type =='quiz' && $lecture->LectureQuiz && $lecture->LectureQuiz->Quiz && ! $lecture->LectureQuiz->Quiz->Question->isEmpty()))
                            $lecture_compelete = true ;
                        else
                            $lecture_compelete = false ;

                    }
                    if($lecture_compelete)
                        $total_lectures++;
                }

            }
            $perc = intval(($total_lectures / $total_sections) * 100) ;
            $lectures = intval(($perc / 100) * 65) ;
        }


	    $pre = 0 ;
	    if(!$course->Target->isEmpty())
	        $pre += 5 ;
	    if(!$course->Req->isEmpty())
	        $pre += 5 ;
	    if(!$course->Pre->isEmpty())
	        $pre += 5 ;

	    $items = [

	        'lectures'=> $lectures ,
            'pre'=> $pre ,
	        'data'=> 10 ,
	        'publihs'=> $course->image ? 10 : 0  ,

        ];
	    $total  = 0 ;
	    foreach ($items as $item )
            $total += $item ;
	    return $total;


    }

    function consultant_contact( $k = false ){

	    $days = [

	        'inperson' => 'حضوری' ,
	        'online' => 'آنلاین' ,
	        'phone' => 'تلفنی' ,
        ];
	    if(($k))
	        return isset($days[$k]) ? $days[$k] : '-';
	    return $days ;

    }
    function seminar_type( $k = false ){
        $days = [

            'seminar' => 'سمینار' ,
            'class' => 'کلاس آموزشی' ,
            'conference' => 'همایش' ,
        ];
	    if(($k))
	        return isset($days[$k]) ? $days[$k] : '-';
	    return $days ;

    }
    function days_in_week( $k = false ){


	    $days = [

	        6 => 'شنبه' ,
	        0 => 'یک شنبه' ,
	        1 => 'دو شنبه' ,
	        2 => 'سه شنبه' ,
	        3 => 'چهار شنبه' ,
	        4 => 'پنج شنبه' ,
	        5 => 'جمعه' ,
        ];
	    if(is_numeric($k))
	        return isset($days[$k]) ? $days[$k] : '-';
	    return $days ;

    }


    function days_in_week_eng ( $k = false ){


	    $days = [

	        6 => 'Saturday' ,
	        0 => 'Sunday' ,
	        1 => 'Monday' ,
	        2 => 'Tuesday' ,
	        3 => 'Wednesday' ,
	        4 => 'Thursday' ,
	        5 => 'Friday' ,
        ];
	    if(is_numeric($k))
	        return isset($days[$k]) ? $days[$k] : '-';
	    return $days ;
     }

    function quiz_point($quiz){

        if($quiz->point_type == 1 )
            return $quiz->total_point ;
        if($quiz->point_type == 2 )
            return $quiz->question_point ;
        if($quiz->point_type == 3 )
            return $quiz->answer_point ;

    }

    function quiz_point_type($quiz){

        if($quiz->point_type == 1 )
            return "امتیاز کلی" ;
        if($quiz->point_type == 2 )
            return "امتیاز برای سوال ها" ;
        if($quiz->point_type == 3 )
            return "امتیاز برای پاسخ ها" ;

    }

    function website_menu_link($menu){

	    if($menu->type == 'link' && $menu->ThisLink)
	        return $menu->ThisLink->Link->link ? $menu->ThisLink->Link->link : '#' ;
	    if($menu->type == 'page'  && $menu->ThisPage)
	        return route('website_page_show' ,['id'=>$menu->ThisPage-> website_page_makers_id]) ;
	    if($menu->type == 'category'  && $menu->ThisCategory)
	        return route('website_category_brows' ,['web'=>$menu->Website->url , 'slug'=>$menu->ThisCategory-> Category->slug]) ;
	    if($menu->type == 'item_type' && $menu->ThisItemType )
            return route('website_category_item' ,['web'=>$menu->Website->url , 'slug'=>$menu->ThisItemType->ItemType->slug]) ;
	    if($menu->type == 'item' && $menu->ThisItem )
            return item_url($menu->ThisItem->Item ,['wb'=>$menu->Website->url]);


	    return '#';

    }

	function price($a = 0 , $cr = 'usd' )
	{
	    if(! is_numeric($a)) return $a ;


		    return number_format($a).currency($cr);
	}


	function item_url($item , $extra = [] ){

	    if($item->type == 'course')
	        return route('course_show' ,['url'=>$item->url] + $extra);
	    if($item->type == 'seminar')
	        return route('seminar_show' ,['url'=>$item->url]+ $extra);
	    if($item->type == 'consultant')
	        return route('consultant_show' ,['url'=>$item->url]+ $extra);
	    if($item->type == 'quiz')
	        return route('quiz_show' ,['url'=>$item->url]+ $extra);
	    if($item->type == 'channel')
	        return route('channel_view' ,['url'=>$item->url]+ $extra);
	    if($item->type == 'product')
	        return route('product_show' ,['url'=>$item->url]+ $extra);

    }
	function item_url_cp($item){

	    if($item->type == 'product')
	        return route('cp_product_show' ,['id'=>$item->id]);
	    if($item->type == 'course')
	        return route('cp_course_show' ,['id'=>$item->id]);
	    if($item->type == 'seminar')
	        return route('cp_seminar_show' ,['id'=>$item->id]);
	    if($item->type == 'consultant')
	        return route('cp_consultant_show' ,['id'=>$item->id]);
	    if($item->type == 'quiz')
	        return route('cp_quiz_show' ,['id'=>$item->id]);
	    if($item->type == 'channel')
	        return route('cp_channel_show' ,['id'=>$item->id]);

    }

	function item_reate($total , $count ){
	    $rate =  $count == 0  ? 0 : round(  $total / $count  , 1);
	    if($rate < 0 )
	        $rate = 0 ;
	    if($rate > 5 )
	        $rate = 5 ;

	    $stars = '' ;
	    for($i= 1 ; $i <=5 ; $i++)
        {
            $stars .= $i <= $rate ? '<i class="fas fa-star icon-small icon-rate" ></i> ' : '<i class="far fa-star icon-small icon-rate" ></i> ' ;
        }
	    return $stars;
    }
	function currency( $cr = 'usd')
	{
		return $cr == 'ir' ? '  IRR ' : ' OUCC  ';
	}

	function site_ad_page(){
	    return [

	        'index'=>'صفحه اول' ,
	        'product'=>'صفحه محصولات' ,
	        'all'=>'همه صفحات' ,
        ];
    }


function get_permissions(){

    foreach (\Illuminate\Support\Facades\Route::getRoutes()->getRoutes() as $route)
    {
        $action = $route->getAction();

        if (array_key_exists('controller', $action) && $action['prefix'] == '/cp')
        {
            $prts = explode("\\" ,  $action['controller']);
            list($ctrl ,$action ) =  explode("@" ,  end($prts));
            $controllers[$ctrl] = $ctrl;
        }
    }

    $stack = [
        "ServiceController" => "درخواست ها",
        "UserController" => "کاربرها",
        "PageController" => "صفحه ساز",
        "TicketController" => "تیکت ها",
        "SettingController" => "تنظیمات",
        "BlogController" => "مقالات",
    ];

    $exclude = permission_exclude() ;


    $export = [] ;
    foreach ($controllers as $ctrl )
    {
        if(in_array( $ctrl , $exclude)) continue ;
        $export[$ctrl] = isset($stack[$ctrl]) ?  $stack[$ctrl] : $ctrl ;
    }

    return $export ;

}

function permission_exclude(){
   return  $exclude = [
        "OperatorController" => "OperatorController",
        "FileController" => "FileController",
        "IndexController" => "IndexController",
        "CoinmeController" => "CoinmeController",
    ];

}
function filter_permissions($data ){

	    if(!is_array($data))
	         return [] ;
	    if(in_array('all' , $data))
	        return ['all'];

	    $stack = array_keys(get_permissions());
	    foreach ($data as $k=>$v)
        {
            if(!in_array($v , $stack))
                unset($data[$k]);
        }

	    return $data ;
}


function short_currency($number = false )
{
    if($number)
        return number_format($number) . " ت ";
    else
        return ' ت';
}

function _CURL($link , $params = []  ){

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $link );

    if(!empty($params))
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
    curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322");
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);

    $output = curl_exec($ch);

    curl_close($ch);

    return $output ;

}


function coin_payment_keys(){
	    return ['c89b9c38d65946ff61ca5733519de99ff55d00af9b3be5f143e397d3d46ad020' ,
            'afd23Eb75008F254e98e5dbFb0E6289aa7437E501dC3b1e84b36FC93859C59dE' ] ;
}




function price_off($o)
	{
		$price = $o->price - (($o->price / 100 ) * $o->off );
		return price($price);
	}


	function liveprice_coins (){

	    return [
  0=>"ETN" ,
  2 => "ADA" ,
  3 => "ARDR",
  4 => "BCH",
  5 => "BCN",
  6 => "BNB",
  7 => "BTC",
  8 => "BTG",
  9 => "BTM",
  10 => "DASH",
  11 => "DGB",
  12 => "DOGE",
  13 => "ELF",
  14 => "EOS",
  15 => "ETC",
  16 => "ETH",
  17 => "ETN",
  18 => "ICX",
  19 => "KMD",
  20 => "LSK",
  21 => "LTC",
  22 => "MCO",
  23 => "MIOTA",
  24 => "MONA",
  25 => "NANO",
  26 => "NEO",
  27 => "OMG",
  28 => "PM",
  29 => "QTUM",
  30 => "REP",
  31 => "SC",
  32 => "TRX",
  33 => "USDT",
  34 => "WAX",
  36 => "XEM",
  37 => "XLM",
  38 => "XMR",
  39 => "XRP",
  40 => "XVG",
  41 => "ZEC",
  42 => "ZRX",
  43 => "ven",

        ];

    }


    function invoice_token(){
	    return 'T' . uniqid().rand(1,9).rand(1,9)  ;
    }







?>
