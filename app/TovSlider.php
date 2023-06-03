<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TovSlider extends Model
{
    function Upload(){
        return $this->belongsTo(Upload::class );
    }
}
