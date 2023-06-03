<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CryptoPayment extends Model
{
    function Response(){
        return $this->hasOne(CryptoPaymentResponse::class , 'crypto_payment_id');
    }
    function User(){
        return $this->belongsTo(User::class );
    }
}
