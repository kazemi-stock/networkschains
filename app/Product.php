<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'title' ,
        'upload_id',
        'slug',
        'image',
        'text' ,
        'price' ,
        'points' ,
        'jest'
    ] ;

    function Upload(){
        return $this->belongsTo(Upload::class );
    }
    function History(){
        return $this->hasMany(ProductHistory::class )->orderBy('id' ,'desc');
    }

    function ProductCategory(){
        return $this->hasMany(ProductCategory::class )->orderBy('category_id' ,'asc');
    }

    function ProductLastCategory(){
        return $this->hasOne(ProductCategory::class )->orderBy('category_id' ,'desc');
    }


}
