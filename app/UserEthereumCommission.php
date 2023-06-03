<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserEthereumCommission extends Model
{
    protected $fillable = ['user_id', 'amount'];

    protected $hidden = ['created_at', 'updated_at'];
}
