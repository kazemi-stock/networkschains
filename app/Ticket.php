<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    function User(){
        return $this->belongsTo('App\User');
    }
    function Dialog(){
        return $this->hasMany('App\TicketDialog');
    }
    function Support(){
        return $this->hasOne('App\TicketSupport');
    }
}
