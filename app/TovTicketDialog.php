<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TovTicketDialog extends Model
{
    function User(){
        return $this->belongsTo('App\User');
    }

}
