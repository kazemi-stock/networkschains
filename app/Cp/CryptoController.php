<?php

namespace App\Cp;

use App\CryptoPayment;
use Illuminate\Database\Eloquent\Model;

class CryptoController extends Model
{
    function index(){
        $payments = CryptoPayment::with('Response')->orderBy('id' , 'desc')->paginate(10);
        return view('cp.payments' , compact('payments'));
    }
}
