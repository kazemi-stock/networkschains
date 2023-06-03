<?php

namespace App\Http\Controllers\Cp;

use App\Brand;
use App\Category;
use App\CategoryBrand;
use App\CategoryFeature;
use App\CategoryFilter;
use App\CategoryFilterOption;
use App\CategorySlider;
use App\ProductCategory;
use App\Upload;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class CategoryController extends Controller
{




    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($parent_id = 0  )
    {



        if($parent_id > 0  )
        {
            $parent = Category::findOrFail($parent_id);
        }


        $category_line = category_line($parent_id);
        $caegories = Category::where(['parent_id'=>$parent_id])->get();
        return view('cp.category-index' , compact('caegories' , 'category_line' ,'parent_id' ));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create( $parent_id = 0  )
    {
        if($parent_id > 0 )
        {
            $parent = Category::findOrFail($parent_id);
        }
        else
            $parent = false;

        return view('cp.category-create' ,['edit'=>false , 'parent_id'=>$parent_id , 'parent'=>$parent]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request = $this->_validation($request);
        $cat  = new Category();
        $cat->fill($request->all());
        $cat->save();

        $this->set_url($cat);
        jok(['url'=> route('category_index_cp' , intval($request->input('parent_id') )> 0 ? ['parent_id'=> $request->input('parent_id') ] : '' ) ]);

    }

    private function _validation(Request $request){


        $whitelist = [
            'title'=>['rule'=> 'required'  , 'title'=>'عنوان '],
            'page_title'=>['rule'=> 'required'  , 'title'=>'عنوان صفحه '],
            'slug'=>['rule'=> 'present'  , 'title'=>'لینک '],
            'parent_id'=>['rule'=> 'required'  , 'title'=>'شناسه پدر '],

        ];


        $validation = \Validator::make($request->all(), rule($whitelist) );
        if($validation->fails())
            jerror($validation , $whitelist );


        $image = false ;
        if($request->input('image'))
            $image = Upload::where('token' , $request->input('image'))->first();

        $addons =  [
            'slug' => prep_url ('categories' ,  $request  ) ,
            'image' =>  $image ? $image->file_name  : null ,
            'upload_id' => $image ? $image->id  : null ,
        ];

        foreach ($addons as $k=>$v )
            $request->request->add([ $k => $v  ]);

        return $request ;


    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $edit = Category::findOrFail($id);
        $parent_id = $edit->parent_id;
        if($parent_id > 0 )
            $parent = Category::findOrFail($parent_id);
        else
            $parent = false;


        return view('cp.category-create' ,['edit'=>$edit , 'parent_id'=>$parent_id , 'parent'=>$parent]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request = $this->_validation($request);

        $cat = Category::findOrFail($id);
        $cat->fill($request->all());
        $cat->save();

        $this->set_url($cat);
        jok(['url'=> route('category_index_cp' , intval($request->input('parent_id') )> 0 ? ['parent_id'=> $request->input('parent_id') ] : '' ) ]);
    }




    function subcategory(Request $request){

        $children = $request->input('id') > 0 ? Category::select('id' ,'title')->where('parent_id' , $request->input('id') )->get() : [];
        jok(['route'=>route('category.subcategory.cp')  , 'subcategories' =>$children]);

     }




    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request )
    {
        $subcats = Category::whereIn('parent_id' , $request['ids'])->get();

        $ids = $request['ids'] ;

        if(!$subcats->isEmpty())
            $ids = $request['ids'] + $subcats->pluck('id')->toArray() ;

        Category::whereIn('parent_id' , $request['ids'])->delete();
        Category::destroy($request['ids']);
        jok();
    }

    private function set_url( $category ){


        $category_line =  array_reverse(category_line($category->id) ) ;

        $url = [];
        foreach ($category_line as $line )
        {
            $url[]=str_replace(','  , '' , $line->slug);
        }
        $category->url = implode('/' , $url);
        $category->save();

    }



}
