<?php

namespace App\Http\Controllers;

use App\BalanceLeftOver;
use App\CommissionInit;
use App\CryptoPayment;
use App\Invoice;
use App\InvoicePoint;
use App\IsbDeposit;
use App\IsbInvest;
use App\MembershipContractRequest;
use App\MembershipContractRequestLock;
use App\Notification;
use App\PartnerContractRequest;
use App\PartnerContractRequestLock;
use App\Pool;
use App\Profile;
use App\ProfileBank;
use App\PurchasePoint;
use App\ServiceRequest;
use App\Ticket;
use App\TicketDialog;
use App\TovTicket;
use App\TovTicketDialog;
use App\Transaction;
use App\TransactionCredit;
use App\Upload;
use App\User;
use App\UserCommission;
use App\UserCurrentPool;
use App\UserPool;
use App\UserPosition;
use App\UserRefer;
use App\Withdraw;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Mockery\Exception;

class DashboardController extends Controller
{
    function index(){


        $inject = json_encode($this->user_tree(Auth::user()));
        $last_check = CommissionInit::where('type' , 'general')->orderBy('id' , 'desc')->first();
        $balance_date_limit =  $last_check ? $last_check->created_at : '0000-00-00 00:00:00' ;
        $balance = $this->user_blanace(Auth::user()->id  , $balance_date_limit );
        return view('dashboard.index' , compact('inject' , 'balance' ));
    }

    function commission(){

        $last_check = CommissionInit::where('type' , 'general')->orderBy('id' , 'desc')->first();
        $balance_date_limit =  $last_check ? $last_check->created_at : '0000-00-00 00:00:00' ;

        $balance = $this->user_blanace(Auth::user()->id  , $balance_date_limit );

        list($pools_commission , $balance_commission) = $this->user_commisions();
        $withdraws = Withdraw::where('user_id' , Auth::user()->id )->sum('amount');
        $inject = json_encode($this->user_tree(Auth::user()));

        return view('dashboard.commission' , compact('inject' , 'balance' , 'pools_commission' , 'balance_commission' , 'withdraws'));
    }

    function children_tree(Request $request){

        $user = User::where('token' , $request->input('node'))->first();
        if(!$user)
            jerror('error');

        $inject = ($this->user_tree($user));

        jok(['inject'=>$inject]);


    }

    private function user_tree($user){
        $data =
            [
                ['id' => $user->id  , 'text_1' =>  $user->id == Auth::user()->id ? 'You' : $user->token , 'text_2' =>  "HERE", 'father'=> null, 'color'=>"#45d5ec" , 'level' => 1 ]
            ] ;
        $data = $this->user_sub_tree( $data , 1 );
        $data = $this->user_sub_tree( $data , 2 );
        return ($data);

    }

    private function user_commisions(){

        $pools_commission = [];
        $balance_commission = [
            'total' => 0 ,
            'current'=> 0
        ] ;

        $pools = Pool::all();
        foreach ($pools as $pool )

        {
            $pools_commission[] = [

                'title' => $pool->title ,
                'total' =>  UserCommission::where('user_id' , Auth::user()->id )->where('pool_id' , $pool->id )->sum('pool_amount') ,
                'current' => UserCommission::where('user_id' , Auth::user()->id )->where('pool_id' , $pool->id )->orderBy('id' , 'desc')->limit(1)->sum('pool_amount') ,

            ];


         }

        $balance_commission = [
            'total' => UserCommission::where('user_id' , Auth::user()->id )->sum('balance_amount') ,
            'current'=> UserCommission::where('user_id' , Auth::user()->id )->orderBy('id' , 'desc')->limit(1)->sum('balance_amount')
        ] ;

        return [$pools_commission , $balance_commission ];



    }

   private function user_blanace($user_id , $balance_date_limit ){

        $right = ['users'=> 0 , 'points'=>0 ,'children'=>[]] ;
        $left = ['users'=> 0 , 'points'=>0 ,'children'=>[]] ;

        $childern = UserPosition::where('parent_id' , $user_id )->get();
        foreach ($childern as $child )
        {
            if($child->position == 'right')
                $right =  $this->user_balance_loop( $child , $right  , $balance_date_limit );
            if($child->position == 'left')
                $left =  $this->user_balance_loop( $child , $left  , $balance_date_limit);
        }

       $balance =  [

           'right'=>$right ,
           'left'=> $left  ,
           'for_next_round_balance_direction' => 0 ,
           'for_nex_month_save_direction' => 0 ,
        ];

       if($balance['right']['points'] < $balance['left']['points'] )
       {
           $balance_direction = 'right';
           $save_direction = 'left';
       }
       else
       {
           $balance_direction = 'left';
           $save_direction = 'right';
       }

       $balance_amount = $balance[$balance_direction]['points'] ;
       $prev_left_over = 0 ;
       $balanceLeftOver = BalanceLeftOver::where('user_id' , Auth::user()->id   )->first();
       if($balanceLeftOver && $balanceLeftOver->{$balance_direction."_direction"} > 0 )
       {
           $prev_left_over =  $balanceLeftOver->{$balance_direction."_direction"};
       }
       $balance_amount += $prev_left_over ;



       $current_balance = $balance_amount  > 6 ? intval($balance_amount / 6) : 0  ;
       $for_next_round_balance_direction = $balance[$balance_direction]['points'] % 6 ;
       $for_nex_month_save_direction =  $for_next_round_balance_direction > 0 ? $balance[$save_direction]['points'] - ($balance[$balance_direction]['points'] - $for_next_round_balance_direction) : 0 ;

       $balance['current'] = [

           $balance_direction => $for_next_round_balance_direction  ,
           $save_direction => $for_nex_month_save_direction  ,
       ];

       return $balance ;



   }

   private function user_balance_loop( $parent , $stack  , $balance_date_limit ){


        $stack['users'] += 1 ;

        $PurchasePoint = $parent->User->total_point;


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

    private function user_sub_tree( $data , $level ){
        $color = $level == 1 ? '#FFC107' : '#8BC34A' ;


        foreach ($data as $d )
        {
            if($d['level'] != $level) continue ;

            $children = [
                [  'text_1' =>  'Free' , 'text_2' =>  "...", 'father'=> null, 'color'=>$color ,'level'=>$level+1] ,
                [   'text_1' =>  'Free' , 'text_2' =>  "...", 'father'=> null, 'color'=>$color,'level'=>$level+1] ,
            ];

            $user_subs = UserPosition::where('parent_id' , $d['id'])->get() ;
            foreach ($user_subs as $us )
            {
                array_shift($children);
                $children[] =  [ 'id' => $us->User->id , 'text_1' =>  $us->User->token  , 'text_2' =>  "Your Sub", 'father'=> $us->parent_id , 'color'=>$color,'level'=>$level+1] ;
            }

            foreach ($children as $k=>$child)
            {
                $child['father'] = $d['id'];
                if(!isset($child['id']))
                $child['id']     = uniqid($d['id'].''.$k);
                $data [] = $child ;
            }
        }

        return $data ;

    }

    function position_create(){

       return view('dashboard.position-create');
    }

    function position_store(Request  $request){


        $whitelist = [
            'ref_code' => ['rule'=>'required' ,'title'=> 'Referal Code'] ,
            'position_code' => ['rule'=>'required' ,'title'=> 'Position Code'] ,
        ];

        $validation = \Validator::make($request->all(),rule($whitelist));
        if($validation->fails())
            jerror($validation , $whitelist);


        $refer = User::where('id' , '!=' , Auth::user()->id )->where('token' , $request->input('ref_code'))->first();
        if(!$refer)
            jerror("Wrong Referal Code !");

        $parent = User::where('id' , '!=' , Auth::user()->id )->where('token' , $request->input('position_code'))->first();
        if(!$parent)
            jerror("Wrong Position Code !");

        if(!$parent->Parent)
        {
            jerror("please select another position code ");
        }



        $parent_subs = UserPosition::where('parent_id' , $parent->id )->get();
        $available_subs = ['left'=>'left' , 'right'=>'right' ];
        foreach ($parent_subs as $ps )
        {
            unset($available_subs[$ps->position]);
        }

        if(empty($available_subs))
            jerror("This position has reached its limit , please enter another position code");

        $position = end($available_subs);
        $pool = Pool::where('level' , 1 )->first();

        \DB::beginTransaction();
        try
        {

            $user_position = new UserPosition();
            $user_position->parent_id = $parent->id ;
            $user_position->position = $position ;
            $user_position->user_id = Auth::user()->id ;
            $user_position->save();

            $user_refer = new UserRefer();
            $user_refer->user_id  = Auth::user()->id ;
            $user_refer->refer_id = $refer->id ;
            $user_refer->save();



            $up = new UserPool();
            $up->pool_id = $pool->id ;
            $up->user_id = Auth::user()->id  ;
            $up->text  = 'first login';
            $up->save();


            $upc = new UserCurrentPool();
            $upc->pool_id = $pool->id ;
            $upc->user_id = Auth::user()->id ;
            $upc->save();

        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror('ERROR'. $e->getMessage() );
        }
        \DB::commit();
        jok(['url'=>route('dashboard.index')]);
    }

    function position_save(Request $request) {
        return response('good...............!!!!!', 200);
    }

    function notification(){
        Notification::where('reciver_id' , Auth::user()->id )->update(['seen'=>1]);
        $notifications = Notification::where('reciver_id' , Auth::user()->id )->get();
        $global_new_notifications = 0 ;
        return view('dashboard.notification' , compact('notifications' , 'global_new_notifications'));

    }

    function notification_delete( $id ){

        if($id == 'all')
        {
            Notification::where('reciver_id' , Auth::user()->id )->delete();
        }
        else
        {
            $not = Notification::where('reciver_id' , Auth::user()->id )->findOrFail($id);
            $not->delete();
        }

        jok(['type'=>$id]);

    }

    function wallet(){
        return view('dashboard.wallet');
    }

    function wallet_store(Request  $request){

        $whitelist = [
            'address' => ['rule'=>'required' ,'title'=> 'address'] ,
        ];
        $validation = \Validator::make($request->all(),rule($whitelist));
        if($validation->fails())
            jerror($validation , $whitelist);

        Auth::user()->wallet_address = $request->address ;
        Auth::user()->wallet_ethAddress = $request->ethAddress ;
        Auth::user()->save();

        jok('Your Wallet(s) save');



    }

    function waiting () {
        return view('waiting');
    }

    function deposit(){
        $payments =  CryptoPayment::where('user_id' , Auth::user()->id )->orderBy('id' , 'desc')->get();
        return view('dashboard.deposit' , compact('payments'));
    }

    function thirdPartyLogin(){
        $apiUrl = 'https://api.drtrader.net/tapi/login';
        $apiKey = 'zq3jlmD7er12hyUPgQQdlsJFDiT5okJenCVlXaj1xEKOneYGiiHdRkqDwhZVYMTx';
        $url = $apiUrl.'?apiKey='.$apiKey.'&user_id='.Auth::user()->id.'&email='.Auth::user()->email;
        $data = file_get_contents($url);
        $data = json_decode($data,true);
        $token = $data['result']['token'];

        $redircetUrl = 'https://drtrader.net/third-party/login?token='.$token;
        header("Location: $redircetUrl");
        exit(0);

    }

    function deposit_store(Request  $request){

        $whitelist = [
            'amount' => ['rule'=>'required|numeric' ,'title'=> 'Amount'] ,
            'tag' => ['rule'=>'required' ,'title'=> 'Tag'] ,
        ];

        $validation = \Validator::make($request->all(),rule($whitelist));
        if($validation->fails())
            jerror($validation , $whitelist);

        $cp = new CryptoPayment();
        $cp->user_id = Auth::user()->id ;
        $cp->tag = $request->input('tag');
        $cp->amount = $request->input('amount');
        $cp->save();
        jok(['url'=>'current']);


    }

    function withdraw(){
        $withdraws =  Withdraw::where('user_id' , Auth::user()->id )->orderBy('id' , 'desc')->get();
        return view('dashboard.withdraw' , compact('withdraws'));
    }

    function withdraw_store(Request  $request){

        $available_amount = intval(Auth::user()->commission - (Auth::user()->commission%10)) ;
        if($available_amount < 1 )
            jerror("Insufficient funds");

        try
        {
            $Withdraw = new Withdraw();
            $Withdraw->user_id = Auth::user()->id ;
            $Withdraw->amount = $available_amount;
            $Withdraw->save();

        }
        catch (\Exception $e )
        {
            jerror("error");
        }


        jok(['url'=>'current']);


    }

    function point_create (){

        $points = PurchasePoint::where('type' , 'direct' )->where('user_id' , Auth::user()->id )->orderBy('id' , 'desc')->get();
        return view('dashboard.point-create' , compact('points'));
    }

    function point_buy(Request $request)
    {
        $setting = (object) $request->attributes->get('global_setting');

        $whitelist = [
            'amount' => ['rule'=>"required|numeric|min:1" ,'title'=> 'amount'] ,
        ];

        $validation = \Validator::make($request->all(),rule($whitelist));
        if($validation->fails())
            jerror($validation , $whitelist);

        $total_price = $setting->PointPrice * $request->input('amount');

        if($total_price > Auth::user()->credit)
            jerror("Insufficient funds");



        \DB::beginTransaction();

        try {

            $invoice = new Invoice();
            $invoice->price = $total_price ;
            $invoice->user_id = Auth::user()->id ;
            $invoice->type = 'point';
            $invoice->save();

            $invoice_point = new InvoicePoint();
            $invoice_point->amount = $request->input('amount');
            $invoice_point->price = $invoice->price ;
            $invoice_point->invoice_id = $invoice->id ;
            $invoice_point->save();


            $transaction = new Transaction();
            $transaction->user_id = $invoice->user_id ;
            $transaction->invoice_id = $invoice->id ;
            $transaction->amount = $invoice->price ;
            $transaction->ptype = 'credit';
            $transaction->save();

            $transaction_credit = new TransactionCredit();
            $transaction_credit->user_id = $invoice->user_id ;
            $transaction_credit->invoice_id = $invoice->id ;
            $transaction_credit->transaction_id = $transaction->id ;
            $transaction_credit->amount = $invoice->price ;
            $transaction_credit->save();

            $purchase = new PurchasePoint();
            $purchase->type = 'direct';
            $purchase->user_id = Auth::user()->id ;
            $purchase->invoice_id = $invoice->id ;
            $purchase->transaction_id = $transaction->id ;
            $purchase->amount = $request->input('amount');
            $purchase->save();




        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror("ERROR!");
        }
        \DB::commit();


        $price  = price($invoice->price);


        jok(['url'=>'current']);



    }

//----------------------------------------------------------------- ISB Invest Function's

    public function invest_index()
    {
        $amount   = IsbInvest::whereUserId(\auth()->id())->first();
        $deposits = IsbDeposit::whereUserId(\auth()->id())->get();
        return view('dashboard.investment.index', compact('deposits', 'amount'));
    }

    public function invest_deposit()
    {
        return view('dashboard.investment.deposit');
    }

    public function invest_deposit_store(Request $request)
    {
        $check = IsbDeposit::whereHash($request->hash)->first();
        if (isset($check)) {
            $error = 'This deposit has already been registered';
            return back()->with('error', $error);
        }
        $dep = new IsbDeposit;
        $dep->user_id      = \auth()->id();
        $dep->amount       = $request->amount;
        $dep->hash         = $request->hash;
        $dep->confirm      = 0;
        $dep->notification = 1;
        if ($dep->save()) {
            return redirect()->route('dashboard.invest.index');
        }else {
            jerror('Something went wrong...! Please try again.');
        }
    }

    public function invest_deposit_convert(Request $request)
    {
        $check = IsbInvest::whereUserId(\auth()->id())->first();
        if (isset($check)) {
            if ($check->oucc_amount < $request->amount) {
                $error = "You're OUCC wallet is less of your request. ( min 10 OUCC)";
                return back()->with('error', $error);
            }else {
                if ($request->amount < 10) {
                    $error = "You're invest amount is less of 10 OUCC. ( min 10 OUCC)";
                    return back()->with('error', $error);
                }else {
                    $check->update([
                        'oucc_amount' => $check->oucc_amount - $request->amount,
                        'isb_amount'  => $check->isb_amount + $request->amount
                    ]);
                }
                $success = "You're convert and invest is done.";
                return back()->with('success', $success);
            }
        }else {
            $error = 'Please deposit your amount to invest ( min 10 OUCC)';
            return back()->with('error', $error);
        }
    }

    public function invest_get_profit()
    {
        $user = IsbInvest::whereUserId(\auth()->id())->first();
        if (isset($user)) {
            if ($user->isb_amount != null || $user->isb_amount != '') {
                $last_time = $user->updated_at;
                $now = new Carbon();
                $date = $now->diffInSeconds($last_time);
                $profit_in_hour = number_format(($user->isb_amount / 100) * 0.01, 8);
                $profit_in_minute = number_format(($profit_in_hour / 60), 8);
                $profit_in_second = number_format(($profit_in_minute / 60), 8);
                $profit = number_format($profit_in_second * $date, 8);


                $user->update([
                    'profit' => number_format($user->profit + $profit, 8)
                ]);
                $data = number_format($user->profit, 8);
            }
            return response($data, 200);
        }
    }
}
