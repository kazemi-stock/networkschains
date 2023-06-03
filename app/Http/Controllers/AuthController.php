<?php

namespace App\Http\Controllers;

use App\AuthToken;
use App\Page;
use App\ProfileUser;
use App\Traits\AuthTrait;
use App\User;
use App\UserRole;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;
use Laravel\Socialite\Facades\Socialite;
use Mockery\Exception;

class AuthController extends Controller
{
    public function redirectToProvider()
    {
        return Socialite::driver('google')->redirect();
    }
    public function handleProviderCallback()
    {
        $user = Socialite::driver('google')->stateless()->user();

        if($user)
        {
            $this_user = User::where('email' , $user->email )->first();
            if($this_user)
            {
                Auth::login($this_user);
                return redirect(url('/'));

            }
            else
            {


//                \DB::beginTransaction();
//                try {
//
//
//                    $social_register = new SocialRegister();
//                    $social_register->data = json_encode($user);
//                    $social_register->save();
//
//                    $password = rand(111111 , 999999 );
//
//
//                    $new_user =  User::create([
//                        'username' => $social_register->id ,
//                        'email' =>  $user->email ,
//                        'password' => bcrypt($password),
//                    ]);
//
//                    $new_user->account_activated = 1 ;
//                    $new_user->save();
//
//                    $profile = new Profile();
//                    $profile->user_id = $new_user->id ;
//                    $profile->save();
//
//                }
//                catch ( \Exception $e )
//                {
//                    \DB::rollBack();
//                    exit("error!" );
//                }
//
//                \DB::commit();
//
//                Auth::login($new_user);
//                return redirect(url("/dashboard/notification"));
                 dd("user not found");


            }
        }

        // $user->token;
    }

    function init(Request $request)
    {
        list($token , $user ) = AuthTrait::init($request);
        jok(['hash'=>$token->hash]);
    }

    function verify(Request $request){

        return AuthTrait::verify($request);

    }

    function compelete(Request $request){

        $at = AuthToken::where('token' , $request->input('token'))->where('hash' , $request->input('hash'))->first();
        if(!$at)
            jerror("کد ارسالی صحیح نمیباشد  ") ;

        $user = User::findOrFail($at->user_id);


        $whitelist = [
            'province'=>['rule'=> 'required|string|exists:provinces,id'  , 'title'=>'استان را انتخاب کنید * '],
            'city'=>['rule'=> 'required|string|exists:cities,id'  , 'title'=>'*شهر را انتخاب کنید '],
            'name'=>['rule'=> 'required|string|max:255'  , 'title'=>'نام '],
            'last_name'=>['rule'=> 'required|string|max:255'  , 'title'=>'نام خوانوادگی '],
            'username'=>['rule'=> 'required|string|max:50|unique:users,username,'.$user->id  , 'title'=>'نام کاربری '],
            'email'=>['rule'=> 'required|string|email|max:50|unique:users,email,'.$user->id  , 'title'=>'ایمیل '],
            'home_address'=>['rule'=> 'present'  , 'title'=>'آدرس منزل '],
        ];

        $validation = \Validator::make($request->all(), rule($whitelist));
        if($validation->fails())
        {
            return response()->json(['stat' => 'er' , 'msg'=> jerror($validation , $whitelist , true ) ]);
        }

        $user->email = $request->input('email');
        $user->username = $request->input('username');
        $user->save();


        $profile = new ProfileUser();
        $profile->user_id = $user->id ;
        $profile->name = $request['name'];
        $profile->last_name = $request['last_name'];
        $profile->province_id = $request['province'];
        $profile->city_id  = $request['city'];
        $profile->address_home = $request['home_address'];
        $profile->save();

        return AuthTrait::verify($request);


    }

    function business_register(){

        if(UserRole::where('user_id' , Auth::user()->id )->where('role' , 'business')->first())
            return redirect(route('index_business'));

        $rules = Page::where('slug' , 'rules-business')->first();
        return view('auth.business-register' , compact('rules'));

    }
    function business_register_store(){

        try
        {
            $role = new UserRole();
            $role->user_id = Auth::user()->id ;
            $role->role = 'business';
            $role->save();

        }
        catch (Exception $e )
        {
            jerror("اشکال در ثبت") ;
        }

        jok(['url'=>route('index_business')]);

    }

}
