<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProfileBank extends Model
{
    protected $fillable = ['shaba_number' ,'account_number' , 'card_number'] ;
    function Profile(){
        return $this->belongsTo(Profile::class );
    }
}
