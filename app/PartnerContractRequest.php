<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PartnerContractRequest extends Model
{
    function User (){
        return $this->belongsTo(User::class ) ;
    }
    function Response (){
        return $this->hasOne(PartnerContractRequestResponse::class , 'request_id') ;
    }

}
