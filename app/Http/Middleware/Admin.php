<?php

namespace App\Http\Middleware;

use App\Course;
use App\Ticket;
use App\TovTicket;
use App\UserLogin;
use App\UserPermission;
use App\UserRole;
use Closure;
use Illuminate\Support\Facades\Auth;

class Admin
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
        $global_permissions = [] ;
        $global_permissions[] = 'all';
        $user_roles = Auth::user()->Roles->pluck('role')->toArray() ;
        if(in_array('superadmin' , $user_roles)  )
        {
            $global_permissions[] = 'all';
        }
        elseif(in_array('admin' , $user_roles))
        {

            $global_permissions = UserPermission::where('user_id' , Auth::user()->id )->get()->pluck('permission')->toArray();
            list( $controller , $func ) = explode('@' , class_basename($request->route()->getAction()['controller']));

            if(!in_array( $controller , permission_exclude()))
            {
                if(!in_array($controller , $global_permissions))
                    return abort(404);

            }

        }
        else
        {
            return abort(404);
        }

        $notifications = [



        ];

        $last_login = UserLogin::where('user_id' , Auth::user()->id )->first();

        view()->share('global_last_login', $last_login);
        view()->share('global_notification', $notifications);
        view()->share('global_permissions', $global_permissions);


        return $next($request);
    }
}
