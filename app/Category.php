<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [ 'title' , 'page_title' , 'slug'  , 'parent_id' , 'upload_id' , 'image'];
    function Upload(){
       return $this->belongsTo(Upload::class  );
    }
    function ParentGroup(){
       return $this->hasMany(Category::class , 'parent_id' ,'parent_id' );
    }
    function SubCategory(){
       return $this->hasMany(Category::class , 'parent_id' );
    }
    function ProductCategory(){
       return $this->hasMany(ProductCategory::class  );
    }

}
