<?php

namespace App\Http\Controllers\Cp;

use App\Withdraw;
use App\WithdrawSuccess;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class WithdrawController extends Controller
{
    function index(){
        $withdraws = Withdraw::with('Success')->orderBy('id' , 'desc')->paginate(10);
        return view('cp.withdraw' , compact('withdraws'));
    }

    function success_store(Request $request , $id ){
        $withdraw = Withdraw::whereDoesntHave('Success')->findOrFail($id);

        try {

            $response  = new WithdrawSuccess();
            $response->withdraw_id  = $withdraw->id ;
            $response->admin_id = Auth::user()->id ;
            $response->save();

        }
        catch (\Exception $e )
        {
            jerror('اشکال در انجام عملیات' . $e->getMessage());
        }

        jok(['url'=>'current']);




    }


}
