<?php

namespace App\Http\Middleware;

use App\MembershipContractAccept;
use Closure;
use Illuminate\Support\Facades\Auth;

class MembershipMiddleware
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


        if(!Auth::user()->Membership)
            return redirect(route('dashboard.membership')) ;

        return $next($request);
    }
}
