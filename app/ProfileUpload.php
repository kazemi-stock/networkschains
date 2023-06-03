<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProfileUpload extends Model
{
    function Upload(){
        return $this->belongsTo(Upload::class );
    }
}
