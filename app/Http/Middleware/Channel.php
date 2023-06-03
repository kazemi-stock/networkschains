<?php

namespace App\Http\Middleware;

use App\ChannelPublic;
use Closure;
use Illuminate\Support\Facades\Auth;

class Channel
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $channel = ChannelPublic::where('user_id' , Auth::user()->id )->first();
        if(!$channel)
        {
            return redirect(route('channel_public_create'));
        }

        return $next($request);
    }
}
