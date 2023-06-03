<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MembershipContractRequest extends Model
{
    function User (){
       return $this->belongsTo(User::class ) ;
    }
    function Response (){
       return $this->hasOne(MembershipContractRequestResponse::class , 'request_id') ;
    }
}
