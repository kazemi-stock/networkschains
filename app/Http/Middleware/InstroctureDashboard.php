<?php

namespace App\Http\Middleware;

use Closure;
use Jenssegers\Agent\Agent;

class InstroctureDashboard
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
        $agent = new Agent();
        if($agent->isMobile()||     $agent->isTablet())
        {
            return redirect(route('instructor_mobile_message'));
        }

        view()->share('global_instrocture_dashboard', true );
        return $next($request);
    }
}
