<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserCurrentPool extends Model
{
    function Pool(){
        return $this->belongsTo(Pool::class );
    }
}
