<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ShopSlider extends Model
{
    function Upload(){
        return $this->belongsTo(Upload::class );
    }
}
