<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CommissionInitConfirm extends Model
{
    function Admin(){
        return $this->belongsTo(User::class  ,'admin_id');
    }

}
