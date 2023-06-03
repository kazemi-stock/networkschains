<?php

namespace App\Http\Controllers\Cp;

use App\TovTicket;
use App\TovTicketDialog;
use App\Ticket;
use App\TicketDialog;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class TicketController extends Controller
{
    function index(Request $request){

        $cond = [] ;
        if($request->input('uid'))
            $cond['user_id'] = $request->input('uid');
        $tickets = TovTicket::where($cond)->paginate(10);
        return view('cp.ticket-index' , compact('tickets'));

    }


    function store(Request $request , $id ){
        $whitelist = [
            'title' => ['rule' => 'required', 'title' => 'عنوان پیام '],
            'text' => ['rule' => 'required', 'title' => 'متن پیام '],

        ];

        $validation = \Validator::make($request->all(), rule($whitelist));

        if ($validation->fails())
            jerror($validation , $whitelist);

        $user = User::findOrFail($id);



        \DB::beginTransaction();
        try {


            $ticket = new TovTicket();
            $ticket->user_id = $user->id ;
            $ticket->title = $request->input('title');
            $ticket->user_alert = 1 ;
            $ticket->save();
            $dialog = new TovTicketDialog();
            $dialog->ticket_id = $ticket->id ;
            $dialog->text = $request->input('text');
            $dialog->user_id = Auth::user()->id ;
            $dialog->save();
        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror('اشکال در انجام عملیات' . $e->getMessage());
        }
        \DB::commit();

        jok();

    }

    function show($id ){

        $ticket  = TovTicket::findOrFail($id);
        $dialogs = TovTicketDialog::with('User')->where('ticket_id' , $id )->get();

        if($ticket->admin_alert != 0  )
        {
            $ticket->admin_alert = 0 ;
            $ticket->save();
        }

        return view('cp.ticket-show' , compact('ticket' , 'dialogs'));

    }
    function store_replay(Request $request , $id ){

        $ticket = TovTicket::findOrFail($id);

        $whitelist = [
            'text' => ['rule' => 'required', 'title' => 'متن پیام '],

        ];

        $validation = \Validator::make($request->all(), rule($whitelist));

        if ($validation->fails())
            jerror($validation , $whitelist);

        $dialog = new TovTicketDialog();
        $dialog->ticket_id = $ticket->id ;
        $dialog->text = $request->input('text');
        $dialog->user_id = Auth::user()->id ;
        $dialog->save();

        $ticket->user_alert = 1 ;
        $ticket->save();

        $dialogs = TovTicketDialog::with('User')->where('ticket_id' , $id )->get();
        jok(['html'=>view('cp.include.ticket-dialog-index' , compact('ticket' , 'dialogs'))->render()]);


    }

}
