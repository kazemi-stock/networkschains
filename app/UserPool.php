<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserPool extends Model
{
    use SoftDeletes ;
    function Pool(){
        return $this->belongsTo(Pool::class , 'pool_id');
    }
    function User(){
        return $this->belongsTo(User::class , 'user_id');
    }
}
