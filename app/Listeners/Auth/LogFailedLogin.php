<?php

namespace App\Listeners\Auth;

use Illuminate\Auth\Events\Failed;
use Illuminate\Http\Request;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Jenssegers\Agent\Agent;

class LogFailedLogin
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    protected $request;

    public function __construct(Request $request)
    {
        $this->request = $request;

    }
    /**
     * Handle the event.
     *
     * @param  Failed  $event
     * @return void
     */
    public function handle(Failed $event)
    {
       if($event->user)
       {
           $agent = new Agent();

           $login = new \App\UserLogin();
           $login->user_id = $event->user->id ;
           $login->browser = $agent->browser();
           $login->device = $agent->device();
           $login->os = $agent->platform();
           $login->ip = $this->request->ip();
           $login->success = 2 ;
           $login->save();

       }
    }
}
