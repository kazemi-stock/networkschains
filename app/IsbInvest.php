<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class IsbInvest extends Model
{
    protected $fillable = ['user_id', 'oucc_amount', 'isb_amount', 'profit', 'created_at', 'updated_at'];
}
