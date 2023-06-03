<?php

namespace App\Http\Controllers\Cp;

use App\Ad;
use App\BalanceLeftOver;
use App\BalanceLeftOverLog;
use App\Channel;
use App\ChannelFollower;
use App\CommissionInit;
use App\CommissionInitPoolGeneral;
use App\Consultant;
use App\Course;
use App\CryptoPayment;
use App\IsbDeposit;
use App\IsbInvest;
use App\IsbWithdraw;
use App\Item;
use App\Notification;
use App\Pool;
use App\Profile;
use App\ProfileBank;
use App\ProfileConfirm;
use App\PurchasePoint;
use App\Quiz;
use App\Seminar;
use App\ServiceRequest;
use App\Ticket;
use App\Transaction;
use App\TransactionIncome;
use App\TransactionWithdraw;
use App\User;
use App\UserCommission;
use App\UserConsultant;
use App\UserCourse;
use App\UserCurrentPool;
use App\UserItem;
use App\UserLogin;
use App\UserNetworkChainConfirm;
use App\UserPermission;
use App\UserPool;
use App\UserPosition;
use App\UserQuiz;
use App\UserRole;
use App\UserSeminar;
use App\Wallet;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    function com_balance_log($com_id , $user_id){

        $log = BalanceLeftOverLog::where('user_id' , $user_id )->where('commission_init_id' ,$com_id)->first();
        if(!$log)
            jerror("Item Not Found");

        jok(['html'=>view('cp.include.blanace-log' , ['log'=>json_decode($log->data)])->render()]);

    }

    public function index(Request $request)
    {

         $sort_filters = ['id'=>'Register Date'  ];
        $sort_types   = ['desc'=>'Ascending' , 'asc'=>'Descending' ];

        $query_sort = ['col'=>'id' , 'type'=>'desc'];

        if($request->input('sort') && in_array($request->input('sort') , array_keys($sort_filters)))
            $query_sort['col'] = $request->input('sort');
        if($request->input('sort_type') && in_array($request->input('sort_type') , array_keys($sort_types)))
            $query_sort['type'] = $request->input('sort_type');


        $cond = [] ;
        if($request->input('email'))
            $cond['email'] = trim($request->input('email'));
        if($request->input('mobile'))
            $cond['mobile'] = trim($request->input('mobile'));

        $query = User::whereHas('CurrentPool')->with('CurrentPool')->where($cond);
        if($request->input('role'))
        {

            if($request->input('role') == 'admin')
                $query->whereHas ('Role' , function ($q){
                    $q->whereIn('role' ,['admin']);
                });

            if($request->input('role') == 'superadmin')
                $query->whereHas ('Role' , function ($q){
                    $q->whereIn('role' ,['superadmin']);
                });

            if($request->input('role') == 'user')
                $query->whereDoesntHave ('Role' , function ($q){
                    $q->whereIn('role' ,['admin' ,'superadmin']);
                });

        }
        $users = $query ->orderBy($query_sort['col'], $query_sort['type'])->paginate(15);



        return view('cp.user-index' , compact('users' , 'sort_filters' , 'sort_types' , 'query_sort' , 'cond' ));
    }

    function index_unconfirmed(){

        $users = User::whereHas('NetworkChain')->whereDoesntHave('NetworkChain.NetworkChainConfirm')->orderBy('id' , 'desc')->paginate(20);
        return view('cp.user-unconfirmed-index' , compact('users'  ));

    }

    public function show(Request $request , $id)
    {
        $user        = User::findOrFail($id);
        if($user->NetworkChain && !$user->NetworkChain->NetworkChainConfirm)
            return $this->show_unconfirmed($user );

        $last_logins = UserLogin::where('user_id' , $user->id )->limit(5)->get();
        $commissions = UserCommission::where('user_id' , $user->id )->orderBy('id' , 'desc')->paginate(20);
        $user_pools  = UserPool::where('user_id' , $user->id )->orderBy('id' , 'desc')->withTrashed()->get();
        $pools = Pool::all();
        $all_users = User::where('id' , '!=' , $user->id )->get();

        $userParent = UserPosition::where('user_id' , $user->id )->first();


        $tree =
            [
                ['id' => $user->id , 'text_1' => $user->name  , 'text_2' =>  "Selected User", 'father'=> $userParent && $userParent->Parent ? $userParent->Parent->id : null , 'color'=>"#ff4949" ]
            ] ;

        if($userParent && $userParent->Parent)
            $tree[] = ['id' => $userParent->Parent->id  , 'text_1' => $userParent->Parent->name  , 'text_2' =>  "Parent", 'father'=>  null , 'color'=>"#45d5ec" ];

        foreach (UserPosition::where('parent_id' , $user->id )->get() as $childern )
            $tree[] = ['id' => $childern->User->id  , 'text_1' => $childern->User->name  , 'text_2' =>  "Child", 'father'=>  $user->id  , 'color'=>"#89ef68" ] ;

        $referals = User::whereHas('Refered' , function($q) use($user){
            $q->where('refer_id' , $user->id ) ;
        })->get();

        $balance_leftover = BalanceLeftOver::where('user_id' , $user->id )->first();

        $last_check = CommissionInit::where('type' , 'general')->orderBy('id' , 'desc')->first();
        $balance = $this->user_blanace( $user->id  , $last_check  );




        return view('cp.user-show' , compact( 'balance' , 'balance_leftover' ,'last_logins','user'  , 'commissions'  ,'user_pools' , 'pools' ,'tree' ,'all_users' , 'userParent' , 'referals'));
    }

    private function user_blanace($user_id , $last_check ){

        $right = ['users'=> 0 , 'points'=>0 , 'total_points'=>0  ,'total_blanace_points'=>0 ,'children'=>[]] ;
        $left = ['users'=> 0 , 'points'=>0 , 'total_points'=>0 ,'total_blanace_points'=>0 ,'children'=>[]] ;
        $balance_date_limit =  $last_check ? $last_check->date_to : '0000-00-00 00:00:00' ;

        $childern = UserPosition::where('parent_id' , $user_id )->get();
        foreach ($childern as $child )
        {
            if($child->position == 'right')
                $right =  $this->user_balance_loop( $child , $right  , $balance_date_limit );
            if($child->position == 'left')
                $left =  $this->user_balance_loop( $child , $left  , $balance_date_limit);
        }
        $balanceLeftOver = BalanceLeftOver::where('user_id' , $user_id   )->first();
        if($balanceLeftOver)
        {
            $right['saved'] = $balanceLeftOver->right_direction ;
            $left['saved'] = $balanceLeftOver->left_direction ;
        }
        else
        {
            $right['saved'] = 0;
            $left['saved'] = 0;
        }
        $right['total_blanace_points'] =  $right['saved'] +  $right['points'];
        $left['total_blanace_points'] =  $left['saved'] +  $left['points'];


        $balance =  [
            'last_check' => $last_check ,
            'total' => UserCommission::where('user_id' , $user_id )->sum('balance_amount') ,
            'current'=> []  ,
            'right'=>$right ,
            'left'=> $left  ,
            'for_next_round_balance_direction' => 0 ,
            'for_nex_month_save_direction' => 0 ,
        ];

        if($balance['right']['total_blanace_points'] < $balance['left']['total_blanace_points'] )
        {
            $balance_direction = 'right';
            $save_direction = 'left';
        }
        else
        {
            $balance_direction = 'left';
            $save_direction = 'right';
        }

        $balance_amount = $balance[$balance_direction]['total_blanace_points'] ;




        $current_balance = $balance_amount  > 6 ? intval($balance_amount / 6) : 0  ;
        $net_loss = $current_balance * 6 ;
        $for_next_round_balance_direction =  $balance[$balance_direction]['total_blanace_points'] - $net_loss ;
        $for_nex_month_save_direction     =  $balance[$save_direction]['total_blanace_points'] - $net_loss ;

        $for_next_round_balance_direction = $for_next_round_balance_direction >= 0 ? $for_next_round_balance_direction : 0 ;
        $for_nex_month_save_direction     = $for_nex_month_save_direction >= 0 ? $for_nex_month_save_direction : 0 ;

        $balance['current'] = [
            'amount' => $current_balance ,
            $balance_direction => $for_next_round_balance_direction  ,
            $save_direction => $for_nex_month_save_direction  ,
        ];

        return $balance ;

    }

    private function user_balance_loop( $parent , $stack  , $balance_date_limit ){


        $stack['users'] += 1 ;

        $PurchasePoint =  PurchasePoint::where('created_at' , '>' , $balance_date_limit )->where('user_id' , $parent->user_id )->sum('amount');
        $total_PurchasePoint = $parent->User->total_point;


        $stack['points'] += $PurchasePoint ;
        $stack['total_points'] += $total_PurchasePoint ;


        $stack['children'][]= [
            'id' => $parent->id ,
            'name' => $parent->User->name   ,
            'point' => $PurchasePoint  ,
            'total_point' => $total_PurchasePoint  ,
        ];

        $childern = UserPosition::where('parent_id' , $parent->user_id )->get();
        foreach ($childern as $child )
        {
            $stack =  $this->user_balance_loop( $child , $stack , $balance_date_limit );
        }

        return $stack ;

    }

    function show_unconfirmed($user){

        $payments = CryptoPayment::where('user_id' , $user->id )->orderBy('id' , 'desc')->get();
        return view('cp.user-unconfirmed-show' , compact( 'user' ,'payments'));

    }

    function confirm_store($id){

        $user = User::whereHas('NetworkChain')->whereDoesntHave('NetworkChain.NetworkChainConfirm')->findOrFail($id);
        $confirm = new UserNetworkChainConfirm();
        $confirm->user_id = $user->id ;
        $confirm->user_network_chain_id = $user->NetworkChain->id ;
        $confirm->admin_id = $user->id ;
        $confirm->save();

        jok('Well done...!');

    }

    function position_update(Request  $request , $id){

        $user = User::findOrFail($id);
        $parent = User::findOrFail($request->input('parent_id'));

        if(!in_array($request->input('position') , ['left' , 'right']))
            jerror("Please set you'r position") ;

        \DB::beginTransaction();
        try
        {
            UserPosition::where('user_id' , $user->id )->delete();
            $up = new UserPosition();
            $up->parent_id = $parent->id ;
            $up->user_id = $user->id ;
            $up->position = $request->input('position') ;
            $up->save();

        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            if(strpos($e->getMessage() , 'Duplicate entry' ) !== false )
                jerror("This position is already set");

            jerror('Sorry...! Something went wrong' . $e->getMessage());
        }
        \DB::commit();

        jok('Everything well done...! thank you for registration');


    }

    function pool_update(Request  $request , $id ){


        $user = User::findOrFail($id);
        $pool = Pool::findOrFail($request->input('pool_id'));
        if(!$pool)
            jerror("Error identifying selected bank!");

        if($user->CurrentPool && $user->CurrentPool->Pool->id == $pool->id )
            jerror("You can not select the current bank!") ;

        $admin  = Auth::user()->name .' With ID ' . Auth::user()->id ;

        \DB::beginTransaction();
        try
        {
           // UserPool::where('user_id' , $user->id )->delete();
            UserCurrentPool::where('user_id' , $user->id )->delete();

            $up = new UserPool();
            $up->pool_id = $pool->id ;
            $up->user_id = $user->id ;
            $up->text  = "Manually changed by the administrator :  $admin ";
            $up->save();

            $upc = new UserCurrentPool();
            $upc->pool_id = $pool->id ;
            $upc->user_id = $user->id ;
            $upc->save();

        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror('Error performing operations' . $e->getMessage());
        }
        \DB::commit();

        $user_pools  = UserPool::where('user_id' , $user->id )->orderBy('id' , 'desc')->withTrashed()->get();
        $pools = Pool::all();

        jok(['msg'=>'Well Done...!' , 'replace'=>'#nav-pool' , 'html'=>view('cp.include.user-pool' , compact('user' ,'user_pools' , 'pools'))->render()]);



    }

//----------------------------------------------------------------------- ISB Investment

    public function invest_index()
    {
        $users = IsbInvest::orderBy('id')->paginate(25);
        return view('cp.investment.index', compact('users'));
    }

    public function invest_deposit()
    {
        $users = IsbDeposit::orderBy('notification')->orderByDesc('id')->paginate(25);
        return view('cp.investment.deposit', compact('users'));
    }

    public function invest_deposit_approve(Request $request)
    {
        $deposit = IsbDeposit::find($request->id);
        $deposit->update([
            'confirm' => 1,
            'notification' => 0
        ]);
        return back();
    }

    public function invest_deposit_confirm(Request $request)
    {
        $deposit = IsbDeposit::find($request->id);
        $deposit->update([
            'confirm' => 2,
            'notification' => 0
        ]);
        $check = IsbInvest::whereUserId($deposit->user_id)->first();
        if (isset($check)) {
            $check->update([
                'oucc_amount' => $check->oucc_amount + $deposit->amount
            ]);
        }else {
            $invest = new IsbInvest;
            $invest->user_id     = $deposit->user_id;
            $invest->oucc_amount = $deposit->amount;
            $invest->isb_amount  = 0;
            $invest->profit      = 0;
            $invest->save();
        }

        return back();
    }

    public function invest_withdraw()
    {
        $users = IsbWithdraw::orderBy('notification')->orderByDesc('id')->paginate(25);
        return view('cp.investment.withdraw', compact('users'));
    }

    public function invest_withdraw_approve(Request $request)
    {
        $deposit = IsbWithdraw::find($request->id);
        $deposit->update([
            'confirm' => 1,
            'notification' => 0
        ]);
        return back();
    }

    public function invest_withdraw_confirm(Request $request)
    {
        $withdraw = IsbWithdraw::find($request->id);
        $check = IsbInvest::whereUserId($withdraw->user_id)->first();
        if (isset($check)) {
            $percent = ($check->profit / 100) * 11;
            $profit = ($check->profit - 6) - $percent;
            if ($profit < 0) {
                $error = 'مقدار برداشت کمتر از صفر است';
                return back()->with('error', $error);
            }else {
                $check->update([
                    'profit' => 0
                ]);
                $withdraw->update([
                    'confirm' => 2,
                    'notification' => 0
                ]);
                $success = 'مقدار '. $profit . ' به کیف پول کاربر واریز شود';
                return back()->with('success', $success);
            }
        }else {
            $error = 'واریزی وجود ندارد';
            return back()->with('error', $error);
        }
    }

    public function invest_withdraw_hash(Request $request)
    {
        $withdraw = IsbWithdraw::find($request->id);
        $withdraw->update([
            'hash' => $request->hash
        ]);
        return back();
    }
}
