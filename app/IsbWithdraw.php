<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class IsbWithdraw extends Model
{
    protected $fillable = ['user_id', 'amount', 'wallet', 'hash', 'confirm', 'notification', 'created_at', 'updated_at'];
}
