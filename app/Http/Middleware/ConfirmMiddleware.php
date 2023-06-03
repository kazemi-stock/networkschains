<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class ConfirmMiddleware
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

        if(Auth::user()->NetworkChain  && !Auth::user()->NetworkChain->NetworkChainConfirm)
            return redirect(route('confirm.waiting'));

        return $next($request);
    }
}
