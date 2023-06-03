<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserPosition extends Model
{
    function User(){
        return $this->belongsTo(User::class );
    }
    function Parent(){
        return $this->belongsTo(User::class ,'parent_id' );
    }
}
