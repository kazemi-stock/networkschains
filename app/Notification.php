<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    function Sender(){
        return $this->belongsTo('App\User' , 'sender_id');
    }
    function Course(){
        return $this->belongsTo('App\Course' , 'reference_id');
    }
}
