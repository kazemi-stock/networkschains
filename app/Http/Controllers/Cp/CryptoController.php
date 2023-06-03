<?php

namespace App\Http\Controllers\Cp;

use App\CryptoPayment;
use App\CryptoPaymentResponse;
use App\Invoice;
use App\PurchaseCredit;
use App\Transaction;
use App\TransactionCrypto;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class CryptoController extends Controller
{
    function index(){
        $payments = CryptoPayment::with('Response')->orderBy('id' , 'desc')->paginate(10);
        return view('cp.payments' , compact('payments'));
    }
    function response_create ($id){
        $payment = CryptoPayment::findOrFail($id);
        return view('cp.payments-response' , compact('payment'));
    }
    function response_store(Request $request , $id ){
        $payment = CryptoPayment::whereDoesntHave('Response')->findOrFail($id);
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

            $response  = new CryptoPaymentResponse();
            $response->crypto_payment_id  = $payment->id ;
            $response->admin_id = Auth::user()->id ;
            $response->status = $request->input('result');
            $response->text = $request->input('text');
            $response->save();


            if($request->input('result') == 'accept')
            {

                    $invoice = new Invoice();
                    $invoice->price = $payment->amount ;
                    $invoice->user_id = $payment->user_id ;
                    $invoice->type = 'credit';
                    $invoice->save();


                    $transaction = new Transaction();
                    $transaction->user_id = $invoice->user_id ;
                    $transaction->invoice_id = $invoice->id ;
                    $transaction->amount = $invoice->price ;
                    $transaction->ptype = 'crypto';
                    $transaction->save();

                    $transaction_online = new TransactionCrypto();
                    $transaction_online->crypto_payment_id = $payment->id  ;
                    $transaction_online->user_id = $invoice->user_id ;
                    $transaction_online->invoice_id = $invoice->id ;
                    $transaction_online->transaction_id = $transaction->id ;
                    $transaction_online->amount = $invoice->price ;
                    $transaction_online->save();


                    $purchase =  new PurchaseCredit();
                    $purchase->user_id = $invoice->user_id ;
                    $purchase->invoice_id = $invoice->id ;
                    $purchase->amount = $payment->amount   ;
                    $purchase->save();

            }


        }
        catch (\Exception $e )
        {
            \DB::rollBack();
            jerror('اشکال در انجام عملیات' . $e->getMessage());
        }
        \DB::commit();

        jok(['url'=>route('cp.crypto')]);




    }

}
