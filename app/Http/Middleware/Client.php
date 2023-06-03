<?php

namespace App\Http\Middleware;

use App\Category;
use App\ChannelFollower;
use App\InstroctureBlog;
use App\Item;
use App\ItemWishlist;
use App\Notification;
use App\Setting;
use App\TovSetting;
use App\TovTicket;
use App\Website;
use App\WishList;
use Closure;
use Illuminate\Support\Facades\Auth;
use Jenssegers\Agent\Agent;

class Client
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

        $unred_tickets =   $new_notifications = 0 ;
        if(Auth::user())
        {

            $notifications = Notification::where('reciver_id' , Auth::user()->id )->with('Sender')->orderBy('id' , 'desc')->limit(10)->get();
            $new_notifications = Notification::where('reciver_id' , Auth::user()->id )->where('seen' , 0 )->count();
            $tickets       = TovTicket::where('user_id' , Auth::user()->id )->limit(10)->get();
            $unred_tickets       = TovTicket::where('user_id' , Auth::user()->id )->where('user_alert' , 1 )->count();

            $user_roles = Auth::user()->Roles->pluck('role')->toArray() ;
            $global_is_agenet = false ;
            if(in_array('agent' , $user_roles) || in_array('employe' , $user_roles))
            {
                $global_is_agenet = true ;
            }

            view()->share('global_is_agenet',  $global_is_agenet );
            view()->share('global_notifications',  $notifications );
            view()->share('global_tickets',  $tickets );
            view()->share('global_unred_tickets',  $unred_tickets );
            view()->share('global_new_notifications',  $new_notifications );

        }

        $settings = TovSetting::all();
        $global_setting = [] ;
        foreach ($settings as $setting )
        {
            $global_setting[$setting->key] = $setting->val ;
        }

        $request ->attributes->add(['global_setting' => $global_setting]);


        $mobile_view = false ;
        $agent = new Agent();
        if($agent->isMobile()||     $agent->isTablet())
        {
            $mobile_view = true ;
        }

        $global_categories = Category::with('SubCategory')->where('parent_id' , 0 )->get();

        view()->share('global_categories',  $global_categories );
        view()->share('global_mobile_view',  $mobile_view );
        view()->share('global_setting',  $global_setting );

        return $next($request);
    }
}
