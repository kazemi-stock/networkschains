<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Withdraw extends Model
{
    function Success(){
        return $this->hasOne(WithdrawSuccess::class ) ;
    }
    function User(){
        return $this->belongsTo(User::class ) ;
    }
}
