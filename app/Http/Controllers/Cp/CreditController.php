<?php

namespace App\Http\Controllers\Cp;

use App\PurchaseCredit;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreditController extends Controller
{
    function index(Request $request)
    {
        $query = PurchaseCredit::orderBy('id' , 'desc')->with('User' , 'Invoice');
        if($request->input('uid'))
            $query->where('user_id' , $request->input('uid'));
        if($request->input('from'))
            $query->whereDate('created_at' , '>=' , convert_date($request->input('from') , 'Y-m-d' , false ));
        if($request->input('to'))
            $query->whereDate('created_at' , '<=' , convert_date($request->input('to') , 'Y-m-d' , false ));

        $total     = $query->sum('amount') ;
        $purchases = $query->paginate(20) ;
        return view('cp.credit-index' , compact('purchases' ,'total')) ;
    }

}
