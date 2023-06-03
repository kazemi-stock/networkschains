<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductHistory extends Model
{
    function User(){
        return $this->belongsTo(User::class );
    }
}
