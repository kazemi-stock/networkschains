<?php

namespace App\Http\Middleware;

use App\Agancy;
use App\UserRole;
use Closure;
use Illuminate\Support\Facades\Auth;

class AgancyMiddelware
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
        if(in_array('agent' , Auth::user()->Roles->pluck('role')->toArray()))
        {
            $agancy = Agancy::where('user_id' , Auth::user()->id )->firstOrFail();
        }
        elseif(in_array('employe' , Auth::user()->Roles->pluck('role')->toArray()))
        {

        }
        else
        {
            return redirect(route('agancy_create'));
        }

        $show_agant_menu = true ;

        $request ->attributes->add(['global_agancy' => $agancy]);
        view()->share('global_agancy',  $agancy );
        view()->share('global_show_agent_menu',  $show_agant_menu );
        return $next($request);
    }
}
