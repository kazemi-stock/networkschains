<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CryptoPaymentResponse extends Model
{
    function Admin(){
        return $this->belongsTo(User::class , 'admin_id');
    }
}
