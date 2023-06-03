<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserNetworkChain extends Model
{
    function NetworkChainConfirm(){
        return $this->hasOne(UserNetworkChainConfirm::class  , 'user_network_chain_id' );
    }

}
