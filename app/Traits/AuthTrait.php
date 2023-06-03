<?php

namespace App\Traits ;
use App\AuthToken;
use App\ServiceRequest;
use App\User;
use App\UserRole;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

trait AuthTrait{

    static function init( $request   ){

        if(!$request->input('mobile'))
            jerror("موبایل را وارد کنید") ;

        $user = User::where('mobile' , $request->input('mobile'))->first();
        if(!$user)
        {
            $user =  User::create([
                'mobile' => $request->input('mobile'),
                'password' => bcrypt($request->input('mobile')),
            ]);

            $role = new UserRole();
            $role->user_id = $user->id ;
            $role->role = 'user';
            $role->save();
        }

        AuthToken::where('user_id' , $user->id )->delete();


        $token = new AuthToken();
        $token->token = rand(11111,55555);
        $token->hash = uniqid();
        $token->user_id = $user->id ;
        $token->save();

        send_sms($user->mobile , $token->token);


        return [$token , $user] ;



    }

    static function verify(Request $request){

        $at = AuthToken::where('token' , $request->input('token'))->where('hash' , $request->input('hash'))->first();
        if(!$at)
            return response()->json(['stat' => 'er'  ,'msg'=>'کد ارسالی صحیح نمیباشد'  ]);

        $user = User::findOrFail($at->user_id);
        $user->confirm = 1 ;
        $user->save();

         Auth::loginUsingId($user->id);
         $url = route('home') ;
         if($request->input('confirm'))
         {
             $sr = ServiceRequest::where('user_id' , $user->id )->find($request->input('confirm'));
             if($sr)
             {
                 $sr->confirm = 1 ;
                 $sr->save();
                 $url = route('service_show' ,['id' =>$sr->id , 'success' => 1 ]);
             }
         }

        return response()->json(['stat' => 'ok'  ,'url'=>$url  ]);


    }


}
