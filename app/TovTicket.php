<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TovTicket extends Model
{
    function User(){
        return $this->belongsTo('App\User');
    }
    function Dialog(){
        return $this->hasMany(TovTicketDialog::class , 'ticket_id');
    }

}
