<?php

namespace App\Listeners\Auth;

use App\Pool;
use App\UserCurrentPool;
use App\UserPool;
use Illuminate\Auth\Events\Login;
use Illuminate\Http\Request;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Jenssegers\Agent\Agent;

class LogSuccessfulLogin
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
     * @param  Login  $event
     * @return void
     */
    public function handle(Login $event)
    {
        $agent = new Agent();

        $login = new \App\UserLogin();
        $login->user_id = $event->user->id ;
        $login->browser = $agent->browser();
        $login->device = $agent->device();
        $login->os = $agent->platform();
        $login->ip = $this->request->ip();
        $login->success = 1 ;
        $login->save();


    }
}
