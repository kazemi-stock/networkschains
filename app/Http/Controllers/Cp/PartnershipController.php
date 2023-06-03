<?php

namespace App\Http\Controllers\Cp;

use App\MembershipContractAccept;
use App\MembershipContractRequest;
use App\MembershipContractRequestLock;
use App\MembershipContractRequestResponse;
use App\Notification;
use App\PartnerContractRequest;
use App\PartnerContractRequestAccept;
use App\PartnerContractRequestLock;
use App\PartnerContractRequestResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class PartnershipController extends Controller
{
    function index(Request $request){
        $cond = [] ;
        if($request->input('uid'))
            $cond['user_id'] = $request->input('uid');

        $requests = PartnerContractRequest::with('User' , 'Response')->where($cond)->orderBy('id' , 'desc')->paginate(10);
        return view('cp.partnership-index' , compact('requests'));

    }

    function response_create($id){

        $mem_req = PartnerContractRequest::whereDoesntHave('Response')->findOrFail($id);
        return view('cp.partnership-response-create' , compact('mem_req'));

    }


    function response_store(Request $request , $id ){

        $mem_req = PartnerContractRequest::whereDoesntHave('Response')->findOrFail($id);
        $whitelist = [
            'result' => ['rule' => 'required|in:accept,deny', 'title' => '* نتیجه انتخاب شده صحیح نمیباشد '],
        ];


        $validation = \Validator::make($request->all(), rule($whitelist));
        if ($validation->fails())
        {
            jerror($validation , $whitelist);
        }

        \DB::beginTransaction();
        try {

            if($request->input('result') != 'accept')
                PartnerContractRequestLock::where('user_id' , $mem_req->user_id )->delete();


            $response  = new PartnerContractRequestResponse();
            $response->request_id  = $mem_req->id ;
            $response->admin_id = Auth::user()->id ;
            $response->type = $request->input('result');
            $response->text = $request->input('text');
            $response->save();


            if($request->input('result') == 'accept')
            {
                $accept = new PartnerContractRequestAccept();
                $accept->user_id = $mem_req->user_id ;
                $accept->request_id = $mem_req->id ;
                $accept->admin_id = Auth::user()->id ;
                $accept->save();
            }

            $not  = new Notification();
            $not->reciver_id = $mem_req->user_id ;
            $not->obj_id = $mem_req->id ;
            $not->title = "درخواست همکاری";
            if($request->input('result') =='accept')
                $not->text = "درخواست همکاری شما با شناسه $mem_req->id تایید شد ";
            if($request->input('result') =='deny')
                $not->text = "درخواست همکاری شما با شناسه $mem_req->id رد شد - توضیحات : $response->text ";
            $not->save();


        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror('اشکال در انجام عملیات' . $e->getMessage());
        }
        \DB::commit();

        jok(['url'=>route('cp.partnership')]);




    }

}
