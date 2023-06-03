<?php

namespace App\Http\Controllers\Cp;

use App\BalanceLeftOver;
use App\BalanceLeftOverLog;
use App\BalanceLeftOverRow;
use App\CommissionInit;
use App\CommissionInitConfirm;
use App\CommissionInitPoolGeneral;
use App\CommissionInitPoolProfessional;
use App\CommissionLeftOver;
use App\CommissionLog;
use App\Pool;
use App\PurchasePoint;
use App\User;
use App\UserCommission;
use App\UserCurrentPool;
use App\UserEthereumCommission;
use App\UserPool;
use App\UserPosition;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use mysql_xdevapi\Exception;


class CommissionController extends Controller
{
    public $GENERAL_POOLS = [1=>'pool_1' , 2=>'pool_2' , 3=>'pool_3' , 5=>'pool_5'] ;

    private function _point_limit($user){

        if($user->total_point >= 300 )
        {
            return $user->total_point * 34 ;
        }
        elseif ($user->total_point >= 100)
        {
            return $user->total_point * 10 ;
        }
        elseif ($user->total_point >= 10)
        {
            return $user->total_point * 5 ;
        }
        else
            return $user->total_point * 3 ;
    }

    function user_blanace($user_id , $balance_date_limit ){

        $right = ['users'=> 0 , 'points'=>0 , 'left_over'=>0 , 'total_point'=>0 ,'children'=>[]] ;
        $left = ['users'=> 0 , 'points'=>0 , 'left_over'=>0  , 'total_point'=>0 ,'children'=>[]] ;

        $childern = UserPosition::where('parent_id' , $user_id )->get();
        foreach ($childern as $child )
        {
            if($child->position == 'right')
              $right =  $this->user_balance_loop( $child , $right  , $balance_date_limit );
            if($child->position == 'left')
                $left =  $this->user_balance_loop( $child , $left  , $balance_date_limit);
        }


        $balanceLeftOver = BalanceLeftOver::where('user_id' , $user_id  )->first();
        if($balanceLeftOver)
        {
            $right['left_over'] = $balanceLeftOver->right_direction ;
            $left['left_over'] = $balanceLeftOver->left_direction ;
        }


        $right['total_point'] = $right['points'] + $right['left_over'] ;
        $left['total_point']  = $left['points'] + $left['left_over'] ;

        return [

            'right'=>$right ,
            'left'=> $left  ,
            'for_next_round_balance_direction' => 0 ,
            'for_nex_month_save_direction' => 0 ,
            'logs' => []
        ];

    }

    function user_balance_loop( $parent , $stack  , $balance_date_limit ){

            $stack['users'] += 1 ;

             $PurchasePoint = PurchasePoint::where('user_id' , $parent->User->id )
                 ->where('created_at' , '>' , $balance_date_limit['from'] )
                 ->where('created_at' , '<' , $balance_date_limit['to'] )
                 ->sum('amount');


        $stack['points'] += $PurchasePoint ;


        $stack['children'][]= [
                'id' => $parent->id ,
                'name' => $parent->User->name   ,
                'point' => $PurchasePoint  ,
            ];

            $childern = UserPosition::where('parent_id' , $parent->user_id )->get();
            foreach ($childern as $child )
            {
                $stack =  $this->user_balance_loop( $child , $stack , $balance_date_limit );
            }

            return $stack ;

    }

    function index(){

        $commisions = CommissionInit::orderBy('id' , 'desc')->paginate(20);
        return view('cp.commission' , compact('commisions'));
    }
    function create_general(){

         list($PurchasePoint , $date_from , $date_to) = $this->total_points();
        return view('cp.commission-cerate-general' , compact('PurchasePoint'));
    }

    function store_general(Request  $request){

        $whitelist = [
            'pool_1'=>['rule'=> 'required|numeric|max:100|min:1'  , 'title'=>'استخر 1 '],
            'pool_2'=>['rule'=> 'required|numeric|max:100|min:1'  , 'title'=>'استخر 2 '],
            'pool_3'=>['rule'=> 'required|numeric|max:100|min:1'  , 'title'=>'استخر 3 '],
            'pool_5'=>['rule'=> 'required|numeric|max:100|min:1'  , 'title'=>'استخر 5 '],

        ];
        $validation = \Validator::make($request->all(), rule($whitelist) );
        if($validation->fails())
            jerror($validation , $whitelist);

        $total = 0 ;
        foreach ($request->all() as $k=>$v)
        {
            if(in_array( $k ,  $this->GENERAL_POOLS))
                $total += $v ;
        }

        if($total > 100 )
            jerror("جمع درصد های وارد شده حداکثر باید 100 باشد");

        list($PurchasePoint , $date_from , $date_to) = $this->total_points();




        \DB::beginTransaction();
        try
        {
            $com = new CommissionInit();
            $com->type      = 'general';
            $com->admin_id  = Auth::user()->id ;
            $com->amount    = $PurchasePoint ;
            $com->date_from = $date_from ;
            $com->date_to   =  $date_to ;
            $com->save();

            $com_general = new CommissionInitPoolGeneral();
            $com_general->fill($request->all());
            $com_general->commission_init_id = $com->id ;
            $com_general->save();

            $this->user_pool_update();


        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror('اشکال در انجام عملیات' . $e->getMessage());
        }
        \DB::commit();

        jok(['url'=>route('cp.commission.confirm.general' ,['id'=>$com_general->id])]);


    }

    function show($id){

        $com = CommissionInit::findOrFail($id);
        if(!$com->Confirm)
        {
            if($com->type == 'professional')
                return redirect(route('cp.commission.confirm.professional' ,['id'=>$com->id]));
            else
                return redirect(route('cp.commission.confirm.general' ,['id'=>$com->id]));

        }

        $com_log = CommissionLog::where('commission_init_id' , $id )->first() ;
        $leftovers = CommissionLeftOver::where('commission_init_id' , $id )->get() ;
        $logs = json_decode($com_log->data);
         if($com->type == 'professional')
         {
             $com_general = $com->Professional;
             return view('cp.commission-professional-show' , compact('com_general' ,'com' , 'logs' , 'leftovers'));

         }
         else
         {
             $com_general = $com->General;
             return view('cp.commission-general-show' , compact('com_general' ,'com' , 'logs' , 'leftovers'));

         }

    }

    function confirm_general($id){

        $com_general = CommissionInitPoolGeneral::findOrFail($id);
        if($com_general->Init->Confirm)
            return redirect(route('cp.commission.show' ,['id'=>$com_general->Init->id]));

        $user_commissions = $this->cal_users_commision($com_general);
        return view('cp.commission-confirm-general' , compact('com_general' ,'user_commissions'));
    }

    function confirm_general_store($id){

        $com_general = CommissionInitPoolGeneral::findOrFail($id);

        $com = $com_general->Init ;
        $balance_date_limit = [
            'from'=> $com->date_from  ,
            'to'=>  $com->date_to ,
        ];

        $commissions_stacks = $this->cal_users_commision($com_general);

        \DB::beginTransaction();
        try {

            $confirm = new CommissionInitConfirm();
            $confirm->admin_id = Auth::user()->id ;
            $confirm->commission_init_id = $com->id ;
            $confirm->save();

            $log = new CommissionLog();
            $log->commission_init_id = $com->id ;
            $log->data = json_encode($commissions_stacks);
            $log->save();

            foreach ($commissions_stacks as $commissions_stack )
            {
                if(empty($commissions_stack['users']))
                {
                    $leftover = new CommissionLeftOver();
                    $leftover->amount = $commissions_stack['total_points'];
                    $leftover->commission_init_id = $com->id ;
                    $leftover->type = 'add';
                    $leftover->pool_id = $commissions_stack['pool_id'] ;
                    $leftover->save();
                }
                else
                {
                    foreach ($commissions_stack['users'] as $commissions_stack_user )
                    {

                        $balance = [

                            'right' => ['users'=> 0 , 'points'=>0 , 'left_over'=>0 , 'total_point'=>0 ,'children'=>[]] ,
                            'left' => ['users'=> 0 , 'points'=>0 , 'left_over'=>0 , 'total_point'=>0,'children'=>[]] ,
                            'for_next_round_balance_direction' => 0 ,
                            'for_nex_month_save_direction' => 0 ,
                            'logs'=>[]

                        ];



                        if($commissions_stack['pool']->level == 2 )
                        {
                           $balance  = $this->user_blanace($commissions_stack_user['user']->user_id , $balance_date_limit );

                        }

                        if($balance['right']['total_point'] < $balance['left']['total_point'] )
                        {
                            $balance_direction = 'right';
                            $save_direction = 'left';
                        }
                        else
                        {
                            $balance_direction = 'left';
                            $save_direction = 'right';
                        }


                        $balance['logs'][] = "  جهت با امتیاز کمتر :  $balance_direction " ;

                        $point_limit = $this->_point_limit($commissions_stack_user['user']->User);
                        $balance_amount = $balance[$balance_direction]['total_point'] ;

                         $this->dump('pool_level');
                        $this->dump($commissions_stack['pool']->level);
                        $this->dump('balance_direction');
                        $this->dump($balance_direction);
                        $this->dump('$balance_amount');
                        $this->dump($balance_amount);

                        $this->dump('balance_amount');
                        $this->dump($balance_amount);


                        $uc = new UserCommission();
                        $uc->user_id = $commissions_stack_user['user']->user_id ;
                        $uc->commission_init_id = $com->id  ;
                        $uc->pool_id = $commissions_stack['pool_id']  ;
                        $uc->user_pool_id = $commissions_stack_user['user']->id  ;
                        $uc->pool_amount = $commissions_stack_user['commission'] ;
                        $uc->balance_amount = $balance_amount  > 6 ? intval($balance_amount / 6) : 0  ;
                        $uc->point_limit = $point_limit ;
                        $uc->amount = $uc->pool_amount +  $uc->balance_amount > $uc->point_limit ? $uc->point_limit : $uc->pool_amount +  $uc->balance_amount ;
                        $uc->save();



                        if($commissions_stack['pool']->level == 2  )
                        {

                            $this->store_balance_commission_data($commissions_stack_user , $balance  , $balance_direction , $save_direction , $com  );
                        }


                    }

                    if($commissions_stack['left_over_point'] > 0 )
                    {
                        $leftover = new CommissionLeftOver();
                        $leftover->amount = $commissions_stack['left_over_point'];
                        $leftover->commission_init_id = $com->id ;
                        $leftover->type = 'use';
                        $leftover->pool_id = $commissions_stack['pool_id'] ;
                        $leftover->save();
                    }

                }
            }

            $this->user_pool_update();

//           throw  new \Exception("something !");
        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror('اشکال در انجام عملیات' . $e->getMessage());
        }
        \DB::commit();
        jok('با موفقیت انجام شد');

    }

    function dump($data){

        return ;
        dump($data);

    }

    private function store_balance_commission_data($commissions_stack_user , $balance  , $balance_direction , $save_direction , $com   ){

        $prev_left_over = $balance[$balance_direction]['left_over'] ;
        BalanceLeftOver::firstOrCreate(['user_id' => $commissions_stack_user['user']->User->id ]);

        if($balance[$balance_direction]['left_over'] > 0  )
        {
            $this->dump('left_over_used');
            $this->dump($balance[$balance_direction]['left_over']);

            $blor_used = new BalanceLeftOverRow();
            $blor_used->amount = $balance[$balance_direction]['left_over'] ;
            $blor_used->commission_init_id = $com->id ;
            $blor_used->user_id = $commissions_stack_user['user']->User->id ;
            $blor_used->direction = $balance_direction ;
            $blor_used->type ='use';
            $blor_used->save();
            $balance['logs'][] = "  $prev_left_over امتیاز در سمت $balance_direction استفاده شد " ;

        }


            $for_next_round_balance_direction = $balance[$balance_direction]['total_point'] > 0 ? $balance[$balance_direction]['total_point'] % 6 : $balance[$balance_direction]['total_point'] ;
            $balance['for_next_round_balance_direction'] = $for_next_round_balance_direction ;
            $balance['logs'][] = "  $for_next_round_balance_direction امتیاز در سمت $balance_direction ذخیره شد " ;

            $blor_b_direction = new BalanceLeftOverRow();
            $blor_b_direction->amount = $for_next_round_balance_direction ;
            $blor_b_direction->commission_init_id = $com->id ;
            $blor_b_direction->user_id = $commissions_stack_user['user']->User->id ;
            $blor_b_direction->direction = $balance_direction ;
            $blor_b_direction->type ='add';
            $blor_b_direction->save();

            $this->dump('$for_next_round_balance_direction');
            $this->dump($for_next_round_balance_direction);




            if($balance[$save_direction]['total_point'] > 0 )
            {
                $this->dump('save_direction_points');
                $this->dump($balance[$save_direction]['total_point']);
                $for_nex_month_save_direction = $balance[$save_direction]['total_point'] - ($balance[$balance_direction]['total_point'] - $for_next_round_balance_direction);
                if($for_nex_month_save_direction < 0 )
                {
                    $this->dump($commissions_stack_user['user']->User->id);
                    $this->dump($for_nex_month_save_direction);
                }

                $balance['for_nex_month_save_direction'] = $for_nex_month_save_direction ;
                $balance['logs'][] = "  $for_nex_month_save_direction امتیاز در سمت $save_direction ذخیره شد " ;

                $blor_save_direction = new BalanceLeftOverRow();
                $blor_save_direction->commission_init_id = $com->id ;
                $blor_save_direction->amount = $for_nex_month_save_direction ;
                $blor_save_direction->user_id = $commissions_stack_user['user']->User->id ;
                $blor_save_direction->direction = $save_direction ;
                $blor_save_direction->type ='add';
                $blor_save_direction->save();

                $this->dump('for_nex_month_save_direction');
                $this->dump($for_nex_month_save_direction);

            }



        $balance_log = new BalanceLeftOverLog();
        $balance_log->user_id = $commissions_stack_user['user']->user_id ;
        $balance_log->commission_init_id = $com->id ;
        $balance_log->data = json_encode($balance);
        $balance_log->save();

    }

    private function dump_data($data){

        return ;
        dump($data);

    }



    private function cal_users_commision($com_general){

        $com = $com_general->Init ;
        $user_pool_stack = [];
        foreach (Pool::where('level' , '!=' , 4 )->get() as $pool)
        {
            $user_pool_stack[$pool->level] = ['pool'=> $pool   , 'pool_id'=> $pool->id  , 'base_point'=>0 ,'total_users' => 0 , 'total_points'=> 0 , 'user_points'=>0 ,'left_over_point'=>$pool->leftover , 'users'=>[]] ;
        }

        $user_pools = UserPool::with('pool' ,'User') ->get(); //testing
        foreach ($user_pools as $user_pool )
        {
            if(in_array($user_pool->Pool->level , array_keys($user_pool_stack)))
            {
                $user_pool_stack[$user_pool->Pool->level]['users'][] = ['user'=>$user_pool , 'limit'=> 0  , 'point'=>0 , 'total_point'=>0 , 'commission' => 0  ] ;
             }
        }


        foreach ($user_pool_stack as $pool_level=>$stack_users )
        {
            $pool_percent = $com_general->{"pool_$pool_level"};
            $total_point  = round(calc_percent($pool_percent , $com->amount) , 2 );
            $total_users  = count($stack_users['users']);
            $left_over_point =  $user_pool_stack[$pool_level]['left_over_point'] ;

            $user_pool_stack[$pool_level]['total_users'] = $total_users ;
            $user_pool_stack[$pool_level]['total_points'] = $total_point + $left_over_point;


            if($total_users < 1 ) continue ;
//            $user_commision = round((($total_point + $left_over_point)/$total_users), 1);

            $this_pool_total_point = 0 ;
            foreach ($stack_users['users'] as $k=>$v)
            {
                $PurchasePoint = PurchasePoint::where('user_id' , $v['user']->user_id)->where('created_at' , '<' , $com_general->Init->date_to )->where('created_at' , '>' , $com_general->Init->date_from )->sum('amount');
                $user_pool_stack[$pool_level]['users'][$k]['point'] = $PurchasePoint ;
                $user_pool_stack[$pool_level]['users'][$k]['total_point'] = $v['user']->User->total_point ;
                $user_pool_stack[$pool_level]['users'][$k]['limit'] = $this->_point_limit($v['user']->User)   ;
                $this_pool_total_point+=$v['user']->User->total_point ;
            }

            $base_point = $user_pool_stack[$pool_level]['total_points']  > 0  && $this_pool_total_point > 0 ? round($user_pool_stack[$pool_level]['total_points'] / $this_pool_total_point , 5 )  : 0 ;
            $user_pool_stack[$pool_level]['base_point'] = $base_point;
            $user_pool_stack[$pool_level]['user_points'] = $this_pool_total_point ;

            foreach ($stack_users['users'] as $k=>$v)
            {
                $user_pool_stack[$pool_level]['users'][$k]['commission'] =  round($base_point * $user_pool_stack[$pool_level]['users'][$k]['total_point'] , 2 ) ;
            }



        }

        return $user_pool_stack;

    }


    private function total_points(){
        $date_to   =    date('Y-m-d H:i:s');
        $date_from = "00-00-00 00:00:00";
        $last_check = CommissionInit::where('type' , 'general')->orderBy('id' , 'desc')->first();
        if(!$last_check)
            $PurchasePoint = PurchasePoint::where('created_at' , '<' , $date_to )->sum('amount');
        else
        {
            $PurchasePoint = PurchasePoint::where('created_at' , '<' , $date_to )->where('created_at' , '>' , $last_check->date_to )->sum('amount');
            $date_from =  $last_check->date_to  ;
        }

        return [$PurchasePoint , $date_from , $date_to];

    }

//    ------------------------------------------ PROFESSINAL ----------------------------

    function create_professional(){
        return view('cp.commission-cerate-professional' );
    }

    function store_professional(Request  $request)
    {
        $whitelist = [
            'point'=>['rule'=> 'required|numeric|min:1'  , 'title'=>'امتیاز '],
        ];

        $validation = \Validator::make($request->all(), rule($whitelist) );
        if($validation->fails())
            jerror($validation , $whitelist);

        $date_to = date('Y-m-d H:i:s');
        $date_from = "00-00-00 00:00:00";
        $last_check = CommissionInit::where('type' , 'professional')->orderBy('id' , 'desc')->first();
        if($last_check)
        {
            $date_from =  $last_check->date_to  ;
        }


        \DB::beginTransaction();
        try
        {
            $com = new CommissionInit();
            $com->type ='professional';
            $com->admin_id = Auth::user()->id ;
            $com->amount = $request->point  ;
            $com->date_from = $date_from ;
            $com->date_to = $date_to ;
            $com->save();

            $com_pro  = new CommissionInitPoolProfessional();
            $com_pro->pool_4 = 100  ;
            $com_pro->commission_init_id = $com->id ;
            $com_pro->save();

            $this->user_pool_update();


        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror('اشکال در انجام عملیات' . $e->getMessage());
        }
        \DB::commit();

        jok(['url'=>route('cp.commission.confirm.professional' ,['id'=>$com_pro->id ])]);

    }
    function confirm_professional($id){


        $com_pro = CommissionInitPoolProfessional::findOrFail($id);


        if($com_pro->Init->Confirm)
            return redirect(route('cp.commission.show' ,['id'=>$com_pro->Init->id]));

        $user_commissions = $this->get_user_profissional($com_pro->Init);

        return view('cp.commission-confirm-professional' , compact('com_pro' ,'user_commissions'));


    }


    function confirm_professional_store($id){

        $com_general = CommissionInitPoolProfessional::findOrFail($id);
        $com = $com_general->Init ;
        $commissions_stacks = $this->get_user_profissional($com_general->Init);

        \DB::beginTransaction();
        try {

            $confirm = new CommissionInitConfirm();
            $confirm->admin_id = Auth::user()->id ;
            $confirm->commission_init_id = $com->id ;
            $confirm->save();

            $log = new CommissionLog();
            $log->commission_init_id = $com->id ;
            $log->data = json_encode($commissions_stacks);
            $log->save();

            foreach ($commissions_stacks as $commissions_stack )
            {
                if(empty($commissions_stack['users']))
                {
                    $leftover = new CommissionLeftOver();
                    $leftover->amount = $commissions_stack['total_points'];
                    $leftover->commission_init_id = $com->id ;
                    $leftover->type = 'add';
                    $leftover->pool_id = $commissions_stack['pool_id'] ;
                    $leftover->save();
                }
                else
                {
                    foreach ($commissions_stack['users'] as $commissions_stack_user )
                    {
//                        $uc = new UserCommission();
//                        $uc->user_id = $commissions_stack_user['user']->user_id ;
//                        $uc->commission_init_id = $com->id  ;
//                        $uc->user_pool_id = $commissions_stack_user['user']->id  ;
//                        $uc->amount = $commissions_stack_user['commission'] ;
//                        $uc->save();

                        $point_limit = $this->_point_limit($commissions_stack_user['user']->User);

                        $uc = new UserCommission();
                        $uc->user_id = $commissions_stack_user['user']->user_id ;
                        $uc->commission_init_id = $com->id  ;
                        $uc->pool_id = $commissions_stack['pool_id']  ;
                        $uc->user_pool_id = $commissions_stack_user['user']->id  ;
                        $uc->pool_amount = $commissions_stack_user['commission'] ;
                        $uc->point_limit = $point_limit ;
                        $uc->amount = $uc->pool_amount > $uc->point_limit ? $uc->point_limit : $uc->pool_amount ;
                        $uc->save();



                    }

                    if($commissions_stack['left_over_point'] > 0 )
                    {
                        $leftover = new CommissionLeftOver();
                        $leftover->amount = $commissions_stack['left_over_point'];
                        $leftover->commission_init_id = $com->id ;
                        $leftover->type = 'use';
                        $leftover->pool_id = $commissions_stack['pool_id'] ;
                        $leftover->save();
                    }

                }
            }

            $this->user_pool_update();
        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror('اشکال در انجام عملیات' . $e->getMessage());
        }
        \DB::commit();
        jok('با موفقیت انجام شد');

    }

    private function get_user_profissional($com){

        $pool = Pool::where('level' , 4 )->firstOrFail();
//        $user_pool_stack[$pool->level] = ['pool_id'=> $pool->id ,'total_users' => 0 , 'total_points'=> 0 ,'left_over_point'=>$pool->leftover , 'users'=>[]] ;
        $user_pool_stack[$pool->level] = ['pool'=> $pool   , 'pool_id'=> $pool->id  , 'base_point'=>0 ,'total_users' => 0 , 'total_points'=> 0 , 'user_points'=>0 ,'left_over_point'=>$pool->leftover , 'users'=>[]] ;

        $user_pools = UserPool::with('pool' ,'User')->where('pool_id' , $pool->id ) ->get();
        foreach ($user_pools as $user_pool )
        {
            $user_pool_stack[$user_pool->Pool->level]['users'][] =  ['user'=>$user_pool , 'limit'=> 0  , 'point'=>0 , 'total_point'=>0 , 'commission' => 0  ] ;
        }


        foreach ($user_pool_stack as $pool_level=>$stack_users )
        {
            $pool_percent = 100;
            $total_point  = round(calc_percent($pool_percent , $com->amount) , 2 );
            $total_users  = count($stack_users['users']);
            $left_over_point =  $user_pool_stack[$pool_level]['left_over_point'] ;

            $user_pool_stack[$pool_level]['total_users'] = $total_users ;
            $user_pool_stack[$pool_level]['total_points'] = $total_point + $left_over_point ;


            if($total_users < 1 ) continue ;


            $this_pool_total_point = 0 ;
            foreach ($stack_users['users'] as $k=>$v)
            {
                $PurchasePoint = PurchasePoint::where('user_id' , $v['user']->user_id)->where('created_at' , '<' , $com->date_to )->where('created_at' , '>' , $com->date_from )->sum('amount');
                $user_pool_stack[$pool_level]['users'][$k]['point'] = $PurchasePoint ;
                $user_pool_stack[$pool_level]['users'][$k]['total_point'] = $v['user']->User->total_point ;
                $user_pool_stack[$pool_level]['users'][$k]['limit'] = $this->_point_limit($v['user']->User)   ;
                $this_pool_total_point+=$v['user']->User->total_point ;
            }

            $base_point = $user_pool_stack[$pool_level]['total_points']  > 0  && $this_pool_total_point > 0 ? round($user_pool_stack[$pool_level]['total_points'] / $this_pool_total_point , 5 )  : 0 ;
            $user_pool_stack[$pool_level]['base_point'] = $base_point;
            $user_pool_stack[$pool_level]['user_points'] = $this_pool_total_point ;

            foreach ($stack_users['users'] as $k=>$v)
            {
                $user_pool_stack[$pool_level]['users'][$k]['commission'] =  round($base_point * $user_pool_stack[$pool_level]['users'][$k]['total_point'] , 2 ) ;
            }


        }

        return $user_pool_stack;
    }





    /////////////////////////////////////////// POOL UPDATE ///////////////////////////////////////////////////////////////////

    function user_pool_update(){

        $pool2 = Pool::where('level' , 2 )->first();
        $users = User::whereHas('CurrentPool' , function ($q) use ($pool2){

            $q->where('pool_id' , '>=' , $pool2->id ) ;

        })->get();
        foreach ($users as $user )
        {

            $tree = $this->user_pool_update_data($user->id );

            $this->update_to_pool3($user );
            $this->update_to_pool4($user->id  , $tree  );
            $this->update_to_pool5($user->id  , $tree );
        }


    }
    private function user_pool_update_data($user_id  ){

        $right = [] ;
        $left = [] ;

        $childern = UserPosition::where('parent_id' , $user_id )->get();
        foreach ($childern as $child )
        {
            if($child->position == 'right')
                $right =  $this->user_pool_update_data_loop( $child , $right   );
            if($child->position == 'left')
                $left =  $this->user_pool_update_data_loop( $child , $left  );
        }

        return [

            'right'=>$right ,
            'left'=> $left  ,
        ];

    }

    private function user_pool_update_data_loop( $parent , $stack   ){
        $stack[]= [
            'id' => $parent->User->id ,
            'name' => $parent->User->name   ,
            'pools' => UserPool::where('user_id' , $parent->User->id ) ->get()
        ];
        $childern = UserPosition::where('parent_id' , $parent->user_id )->get();
        foreach ($childern as $child )
        {
            $stack =  $this->user_pool_update_data_loop( $child , $stack  );
        }
        return $stack ;
    }



    function  update_to_pool3($user  )
    {


         $pool2 = Pool::where('level' , 2 )->first();
         $pool3 = Pool::where('level' , 3 )->first();

         if($user->CurrentPool->Pool->level >= $pool3->level ) return ;

         $user_pool_2 = UserPool::where('user_id' , $user -> id )->where('pool_id' , $pool2->id )->first();

         if(!$user_pool_2) return ;
         if($user_pool_2->commission <= 0 ) return ;
         if($user->total_point < 10 ) return ;

         $referals = User::whereHas('Refered' , function($q) use($user){

             $q->where('refer_id' , $user->id ) ;

         })->whereHas('UserPool' , function($q) use($pool2){

             $q->where('pool_id' , $pool2->id )->where('commission' , '>' , 0 ) ;

         })->get();

         if(count($referals) >= 2 )
         {
             UserCurrentPool::where('user_id' , $user->id )->delete();

             $up = new UserPool();
             $up->pool_id = $pool3->id ;
             $up->user_id = $user->id ;
             $up->text  = "رسیدن به شرایط صندوق  ";
             $up->save();

             $upc = new UserCurrentPool();
             $upc->pool_id = $pool3->id ;
             $upc->user_id = $user->id ;
             $upc->save();
         }

    }
    function  update_to_pool4($user_id , $tree )
    {
        $user = User::find($user_id);

        $pool3 = Pool::where('level' , 3 )->first();
        $pool4 = Pool::where('level' , 4 )->first();
        if($user->CurrentPool->Pool->level >= $pool4->level ) return ;

        $user_pool_3 = UserPool::where('user_id' , $user -> id )->where('pool_id' , $pool3->id )->first();

        if(!$user_pool_3) return ;
        if($user_pool_3->commission <= 0 ) return ;
        if($user->stock < 1 ) return ;
        if($user->total_point < 100 ) return ;
        if($user->total_commission < 100 ) return ;

        $balanced_usrs = [
            'left' => 0 ,
            'right' => 0 ,
        ];

        if(!empty($tree['left']))
        foreach ($tree['left'] as $left_user )
        {
            foreach ($left_user->pools as $left_user_pool )
            {
                if($left_user_pool->id == $pool3->id  && $left_user_pool->commission > 0 )
                {
                    $balanced_usrs['left']++ ;
                }
            }
        }

        if(!empty($tree['right']))
        foreach ($tree['right'] as $left_user )
        {
            foreach ($left_user->pools as $left_user_pool )
            {
                if($left_user_pool->id == $pool3->id  && $left_user_pool->commission > 0 )
                {
                    $balanced_usrs['left']++ ;
                }
            }
        }



         if($balanced_usrs['left'] < 7 || $balanced_usrs['right'] < 7  ) return ;

        $pool2 = Pool::where('level' , 2 )->first();

        $referals = User::whereHas('Refered' , function($q) use($user){

            $q->where('refer_id' , $user->id ) ;

        })->whereHas('UserPool' , function($q) use($pool2){

            $q->where('pool_id' , $pool2->id )->where('commission' , '>' , 0 ) ;

        })->get();

        if(count($referals) >= 4 )
        {

             UserCurrentPool::where('user_id' , $user->id )->delete();

             $up = new UserPool();
             $up->pool_id = $pool4->id ;
             $up->user_id = $user->id ;
             $up->text  = "رسیدن به شرایط صندوق  ";
             $up->save();

             $upc = new UserCurrentPool();
             $upc->pool_id = $pool4->id ;
             $upc->user_id = $user->id ;
             $upc->save();
         }

    }
    function  update_to_pool5($user_id , $tree )
    {

         $user = User::find($user_id);

         $pool4 = Pool::where('level' , 4 )->first();
         $pool5 = Pool::where('level' , 5 )->first();
         if($user->CurrentPool->Pool->level >= $pool5->level ) return ;

         $user_pool_4 = UserPool::where('user_id' , $user -> id )->where('pool_id' , $pool4->id )->first();

         if(!$user_pool_4) return ;
         if($user->total_point < 300 ) return ;

        $balanced_usrs = [
            'left' => 0 ,
            'right' => 0 ,
        ];

        if(!empty($tree['left']))
        foreach ($tree['left'] as $left_user )
        {
            foreach ($left_user->pools as $left_user_pool )
            {
                if($left_user_pool->id == $pool4->id  && $left_user_pool->commission > 0 )
                {
                    $balanced_usrs['left']++ ;
                }
            }
        }

        if(!empty($tree['right']))
        foreach ($tree['right'] as $left_user )
        {
            foreach ($left_user->pools as $left_user_pool )
            {
                if($left_user_pool->id == $pool4->id  && $left_user_pool->commission > 0 )
                {
                    $balanced_usrs['left']++ ;
                }
            }
        }



         if($balanced_usrs['left'] < 7 || $balanced_usrs['right'] < 7  ) return ;


             UserCurrentPool::where('user_id' , $user->id )->delete();

             $up = new UserPool();
             $up->pool_id = $pool5->id ;
             $up->user_id = $user->id ;
             $up->text  = "رسیدن به شرایط صندوق  ";
             $up->save();

             $upc = new UserCurrentPool();
             $upc->pool_id = $pool5->id ;
             $upc->user_id = $user->id ;
             $upc->save();
         }

public function eth_balance(Request $request)
    {
        $user_com = UserEthereumCommission::where('user_id', $request->id)->first();
        if ($user_com) {
            $user_com->update([
                'amount' => $request->amount
            ]);
            return response()->json($request->amount, 200);
        }else {
            $commission = new UserEthereumCommission;
            $commission->user_id = $request->id;
            $commission->amount = $request->amount;
            if ($commission->save())
                return response()->json($request->amount, 200);
            else
                return response('Error', 404);
        }
    }


}
