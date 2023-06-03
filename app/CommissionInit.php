<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CommissionInit extends Model
{
    function Confirm(){
        return $this->hasOne(CommissionInitConfirm::class );
    }
    function Admin(){
        return $this->belongsTo(User::class  ,'admin_id');
    }
    function General(){
        return $this->hasOne(CommissionInitPoolGeneral::class   ,'commission_init_id');
    }
    function Professional(){
        return $this->hasOne(CommissionInitPoolProfessional::class   ,'commission_init_id');
    }
}
