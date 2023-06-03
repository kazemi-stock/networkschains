<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BourseNews extends Model
{
    function ImageUpload(){
        return $this->belongsTo(Upload::class , 'image_upload_id');
    }

    function BannerUpload(){
        return $this->belongsTo(Upload::class , 'banner_upload_id');
    }

    public function scopeActive($query)
    {
        return $query->whereNull('publish_date')->orWhere('publish_date' , '<=' ,  date('Y-m-d H:i:s'));
    }

}
