<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class IsbDeposit extends Model
{

    protected $fillable = ['user_id', 'amount', 'hash', 'confirm', 'notification', 'created_at', 'updated_at'];
}
