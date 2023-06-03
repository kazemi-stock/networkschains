<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'mobile' ,'token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    function Membership(){
        return $this->hasOne(MembershipContractAccept::class);
    }

    function Profile(){
        return $this->hasOne(Profile::class);
    }
     function Login(){
        return $this->hasMany(UserLogin::class);
    }
    function LastLogin(){
        return $this->hasOne(UserLogin::class)->orderBy('id' , 'desc');
    }

     function Role(){
        return $this->hasOne(UserRole::class);
    }

    function Roles(){
        return $this->hasMany(UserRole::class);
    }


    function Alias (){
        return $this->name ;
    }

    function Position(){
        return $this->hasOne(UserPosition::class , 'user_id');
    }

    function Parent(){
        return $this->hasOne(UserPosition::class , 'user_id');
    }

    function Sub(){
        return $this->hasMany(UserPosition::class , 'parent_id');
    }
    function SubLeft(){
        return $this->hasOne(UserPosition::class , 'parent_id')->where('position' , 'left');
    }
    function SubRight(){
        return $this->hasOne(UserPosition::class , 'parent_id')->where('position' , 'rigth');
    }

    function CurrentPool(){
        return $this->hasOne(UserCurrentPool::class  );
    }
    function UserPool(){
        return $this->hasMany(UserPool::class  );
    }

    function NetworkChain(){
        return $this->hasOne(UserNetworkChain::class  , 'user_id' );
    }
    function Refered(){
        return $this->hasOne(UserRefer::class   , 'user_id' );
    }



 }
