<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CommissionLeftOver extends Model
{
    function Pool(){
        return $this->belongsTo(Pool::class);
    }
}
