<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    protected $fillable = ['name' , 'last_name' , 'father_name' ,'i_number' ,'n_number' ,'address' ,'postal_code' ,'phone' ,'mobile'  ] ;

    function ProfileUpload(){
        return $this->hasMany(ProfileUpload::class);
    }
    function ProfileConfirmRequest(){
        return $this->hasOne(ProfileConfirmRequest::class);
    }
    function ProfileBank(){
        return $this->hasMany(ProfileBank::class);
    }
    function ProfileAcceptRules(){
        return $this->hasOne(ProfileAcceptRules::class);
    }
    function User(){
        return $this->belongsTo(User::class);
    }


}
