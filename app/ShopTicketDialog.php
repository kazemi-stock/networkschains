<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ShopTicketDialog extends Model
{
    function User(){
        return $this->belongsTo('App\User');
    }

}
