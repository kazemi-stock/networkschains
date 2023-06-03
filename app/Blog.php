<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    function ImageUpload(){
        return $this->belongsTo(Upload::class , 'image_upload_id');
    }

    function BannerUpload(){
        return $this->belongsTo(Upload::class , 'banner_upload_id');
    }

    function BlogCategory(){
        return $this->hasMany('App\BlogCategory');
    }

    function BlogImage(){
        return $this->hasMany('App\BlogImage');
    }

    public function scopeActive($query)
    {
        return $query->whereNull('publish_date')->orWhere('publish_date' , '<=' ,  date('Y-m-d H:i:s'));
    }
    public static function boot() {
        parent::boot();

        static::deleting(function($blog) {
            $blog->BlogCategory()->delete();
            $blog->BlogImage()->delete();
        });
    }

}
