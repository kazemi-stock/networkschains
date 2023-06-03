<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CommissionInitPoolProfessional extends Model
{
    function init(){
        return $this->belongsTo(CommissionInit::class  , 'commission_init_id');
    }

}
