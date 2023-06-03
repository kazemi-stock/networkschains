<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PurchaseCredit extends Model
{
    function User(){
        return $this->belongsTo(User::class );
    }
    function Invoice(){
        return $this->belongsTo(Invoice::class );
    }
}
