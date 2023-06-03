<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CommissionInitPoolGeneral extends Model
{
    protected $fillable = ['pool_1' , 'pool_2' ,'pool_3' ,'pool_5'];
    function init(){
        return $this->belongsTo(CommissionInit::class  , 'commission_init_id');
    }
}
