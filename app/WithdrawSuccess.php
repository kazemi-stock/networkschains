<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WithdrawSuccess extends Model
{
    function Admin(){
        return $this->belongsTo(User::class , 'admin_id' ) ;
    }

}
