<?php

namespace App\Http\Controllers\Auth;

use App\EmailVerificationSent;
use App\Mail\RegisterMail;
use App\Profile;
use App\User;
use App\Http\Controllers\Controller;
use App\UserNetworkChain;
use App\UserRole;
use App\UserToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/dashboard';
    private $request ;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request)
    {
        $this->middleware('guest');
        $this->request = $request ;

    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'name' => ['required' , 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'zipcode' => ['required', 'string'],
            'company' => ['required', 'string', 'in:Pazhtazan'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        $token = $this->generate_token() ;

        $user =  User::create([
            'token' => $token,
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);


        $es = new EmailVerificationSent();
        $es->user_id = $user->id ;
        $es->email   = $user->email ;
        $es->save();


        $role = new UserRole();
        $role->user_id = $user->id ;
        $role->role = 'user';
        $role->save();

        $unetwork = new UserNetworkChain();
        $unetwork->user_id = $user->id ;
        $unetwork->save();

      //  Mail::to($user->email)->send(new RegisterMail(['user'=>$user ]));

        return $user ;
    }


    function generate_token(){

        $duplicate = true ;
        $length = 6;
        $alphabet = '123456789011121314151617181920ABCDEFGHIJKLMNOPQRSTUVWXYZ';

        while ($duplicate)
        {

            $pass = [];
            $alphaLength = strlen($alphabet) - 1;
            for ($i = 0; $i < $length; $i++) {
                $n = rand(0, $alphaLength);
                $pass[] = $alphabet[$n];
            }
            $var = implode($pass);


            try
            {
                UserToken::create(['token' => $var ]);
                $duplicate = false ;
            }
            catch (\Exception $E )
            {

            }

        }

        return $var ;
    }
}
