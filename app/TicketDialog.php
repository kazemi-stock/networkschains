<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TicketDialog extends Model
{
   function User(){
       return $this->belongsTo('App\User');
   }
}
