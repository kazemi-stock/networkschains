<?php
namespace App\Helpers;
use App\Category;
use App\BookCategory;
class CategoryHelper{
    private $cats = [];
    private $checked = [] ;

    function preload( $edit = false ){
        $cats = Category::all();
        foreach($cats as $c )
        {
            $this->cats[$c->parent_id][] = $c;
        }

        if($edit)
        {
            if(is_array($edit))
                $this->checked = $edit ;
            else
            {
                $book_cats =BookCategory::where(['book_id'=>$edit->id])->get();
                foreach ($book_cats as $b )
                {
                    $this->checked[] = $b->category_id;
                }

            }
        }
    }

    function category_parent(  $parent_id = 0  ){

        $line = array();
        $found_ = 1 ;
        while($parent_id >= 0 && $found_ ) {

            foreach($this->cats as $k=>$cat_group )
            {   $found_ = false;
                foreach($cat_group as $obj  )
                {
                    if($obj->id == $parent_id )
                    {
                        $parent_id = $obj->parent_id;
                        $line[$obj->id] = $obj;
                        $found_ = true ;
                    }
                }
            }
        }
        return $line ;
    }



    function select_list($parent_id = 0 ){
        if(!isset($this->cats[$parent_id]))
            return '';

        if($parent_id == 0 )
            $export = '<ul class="category">';
        else
            $export = '<ul class="sub-category">';


        foreach( $this->cats[$parent_id] as $parent )
        {
            $checked = in_array($parent->id , $this->checked ) ? 'checked' : '' ;
            $export .= "<li><input type='checkbox' value='$parent->id' class='category-selector' $checked >  $parent->title ";
            $export .= $this->select_list($parent->id);
            $export .= "</li>";

        }
        $export .= '</ul>';

        return $export;

    }

    function category_menue ( $current = 0  ,  $url=array()){

        $pack = $this->cats;

        if(!isset($pack[$current]) || empty($pack[$current]))
            return '';

        $export =  $current == 0 ? '<ul class="menu">' : '<ul>';
        foreach($pack[$current] as $c )
        {
            if($current == 0 )
                $url=array($c->slug);
            else
                $url[] =  $c->slug  ;

            $link = implode( '/' , ( $url ) );

            $export .=  "<li> <a href='".route('search_category' , $link)."'> $c->title   </a>";
            $export .= $this->category_menue($c->id  , $url );
            $export .=  " </li>";
        }

        $export .=  '</ul>';

        return $export;
    }



}