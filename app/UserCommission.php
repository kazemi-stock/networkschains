<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserCommission extends Model
{
    function UserPool(){
        return $this->belongsTo(UserPool::class , 'user_pool_id')->withTrashed();
    }
}
