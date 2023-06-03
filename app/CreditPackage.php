<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CreditPackage extends Model
{
    use SoftDeletes ;
    function Upload(){
        return $this->belongsTo(Upload::class ) ;
    }
}
