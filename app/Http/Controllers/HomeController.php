<?php

namespace App\Http\Controllers;

use App\Blog;
use App\EmailVerification;
use App\EmailVerificationSent;
use App\Faq;
use App\Mail\RegisterMail;
use App\Product;
use App\ShopSlider;
use App\Slider;
use App\TovPage;
use App\TovSlider;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function index(Request $request)
    {
        if($request->input('email'))
        {
            dump('SENDING EMAIL TO : ');
            dump($request->input('email'));
            $res = Mail::to($request->input('email'))->send(new RegisterMail(['user'=>User::find(2) ]));
            dd($res);
        }

        return view('home');
    }

    function page($slug){


        $page = TovPage::where('slug' , $slug )->firstOrFail();
        return view('page-show' , compact('page'));

    }

    function faq(){
        $faqs = Faq::all();
        return view('faq' , compact('faqs'));
    }
    function require_verify_email( ){

        return view('email-verification' , ['msg' => 'require']);
    }

     function resend_verify_email(){

        if(Auth::user()->email_verified_at !== null )
            jerror("This email has already been activated");

        $today_sents  =  EmailVerificationSent::where('user_id' , Auth::user()->id )->whereDate('created_at' , date('Y-m-d'))->count();

        if($today_sents >= 3 )
            jerror("You have used your daily capacity of 3 emails and you can not send new emails until tomorrow");

        $last_sent =  EmailVerificationSent::where('user_id' , Auth::user()->id )->OrderBy('id' , 'desc')->first();

        if($last_sent && ((time() - strtotime($last_sent->created_at))  <= 20) )
            jerror("Please wait 20 seconds to resend the email");

        $es = new EmailVerificationSent();
        $es->user_id = Auth::user()->id ;
        $es->email = Auth::user()->email ;
        $es->save();

        Mail::to(Auth::user()->email)->send(new RegisterMail(['user'=>Auth::user() ]));

        jok('An email has been sent to you again, Please note that you can request an email up to 3 times');

    }

    function verify_email($id , $token ){


        $user = User::findOrFail($id);
        if($user->email_verified_at !== null )
            return view('email-verification' , ['msg' => 'duplicate']);

        if(md5($user->token) !== $token )
            return view('email-verification' , ['msg' => 'wtoken']);



        try
        {
            $v = new EmailVerification();
            $v->user_id = $user->id ;
            $v->save();
        }
        catch (\Exception $e )
        {
            return view('email-verification' , ['msg' => 'duplicate']);
        }
        return view('email-verification' , ['msg' => 'success']);
    }

}
