<?php

namespace App\Http\Controllers\Cp;

use App\Invoice;
use App\Pool;
use App\PurchaseCredit;
use App\PurchasePoint;
use App\ShopTicket;
use App\Ticket;
use App\TovTicket;
use App\Transaction;
use App\User;
use App\UserCurrentPool;
use App\UserPool;
use App\UserPosition;
use App\Withdraw;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class
HomeController extends Controller
{
    function index(Request $request){
        $stats =
        [
            [
                'title'=> 'جمع کل امتیازها' ,
                'value' => User::sum('total_point')
            ] ,
            [
                'title'=> 'جمع موجودی امتیازها' ,
                'value' => User::sum('point')
            ] ,
            [
                'title'=> 'جمع کل اعتبار ها' ,
                'value' => PurchaseCredit::sum('amount')
            ],
            [
                'title'=> 'جمع موجودی اعتبار ها' ,
                'value' => User::sum('credit')
            ] ,
            [
                'title'=> 'جمع کل کامیشن ها' ,
                'value' => User::sum('total_commission')
            ],
            [
                'title'=> 'جمع موجودی کامیشن ها' ,
                'value' => User::sum('commission')
            ] ,
            [
                'title'=> 'جمع کل برداشت ها' ,
                'value' => Withdraw::has('Success')->sum('amount')
            ]


        ];

        return view('cp.home' , compact('stats'));
    }



    function notifications(){
        $global_notification = [
            'ticket'=>[
                'count'=>TovTicket::where('admin_alert' , 1 )->count() ,
                'route'=>route('cp_ticket_index') ,
                'title'=>'تیکت جدید'
            ]
        ];
        jok(['html'=>view('cp.include.notifications' , ['global_notification'=>$global_notification] )->render()]);
    }

    function upload_image(Request $request){

        $result = \App\Traits\Upload::upload_image($request);
        if($result['stat'] != 'ok')
            jerror($result['msg']);

        jok(
            [
                'render'=>'default' ,
                'preview'=> upload_url($result['upload']->file_name) ,
                'file_name' => $result['upload']->original_name ,
                'size' => 100,
                'token' => $result['upload']->token,
            ]);

    }

}
