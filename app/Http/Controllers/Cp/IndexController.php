<?php

namespace App\Http\Controllers\Cp;

use App\Course;
use App\Item;
use App\ItemPublishConfirm;
use App\ItemPublishRequest;
use App\ItemTransaction;
use App\Notification;
use App\ProfileConfirm;
use App\ServiceRequest;
use App\Technician;
use App\Ticket;
use App\TransactionDocument;
use App\TransactionWithdraw;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{
   function index(Request $request){

      $all_stat = [
          'users' => User::count() ,
          'tickets' => Ticket::count() ,
      ];

      $today_data = [
          'users' => User::orderBy('id' , 'desc')->get() ,
          'tickets' => Ticket::orderBy('id' , 'desc')->get() ,
      ];

       return view('cp.index' , compact('all_stat' , 'today_data') );
   }

   function notifications(){
       $global_notification = [


           'ticket'=>[
               'count'=>Ticket::where('admin_alert' , 1 )->count() ,
               'route'=>route('cp_ticket_index') ,
               'title'=>'تیکت جدید'
           ],


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
