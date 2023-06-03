<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    function Category(){
        return $this->belongsTo(Category::class  );
    }
    function Product(){
        return $this->belongsTo(Product::class  );
    }
}
