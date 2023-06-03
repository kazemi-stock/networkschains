<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ShopTicket extends Model
{
    function User(){
        return $this->belongsTo('App\User');
    }
    function Dialog(){
        return $this->hasMany(ShopTicketDialog::class , 'ticket_id');
    }

}
