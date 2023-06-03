<?php

namespace App\Http\Controllers\Cp;

use App\Category;
use App\Product;
use App\ProductCategory;
use App\ProductHistory;
use App\Upload;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    function index(){

        $products = Product::orderBy('id' , 'desc')->paginate(20);
        return view('cp.product-index' , compact('products'));
    }


    function show($id)
    {
        $product = Product::findOrFail($id);
        return view('cp.product-show' , compact('product'));

    }

    function create(){
        $categories  = Category::where('parent_id' , 0)->get();
        return view('cp.product-create' , compact('categories'));
    }

    function edit($id){

        $product = Product::findOrFail($id);
        $upload =  $product->Upload ;


        $categories  = [];
        foreach ($product->ProductCategory as $pc )
            $categories[] =  $pc->Category ;

        return view('cp.product-edit' , compact('product' , 'upload' ,'categories'));

    }

    function revision($id){

        $history = ProductHistory::findOrFail($id);
        $product = json_decode($history->data);
        $upload =  Upload::find($product->upload_id) ;

        $categories  = [];
        foreach ($product->product_cateory as $pc )
        {
            $c = Category::find($pc->category_id);
            if($c)
                $categories[] = $c ;
        }

        return view('cp.product-edit' , compact('product' , 'upload' ,'categories'));

    }

    function store(Request $request){


        $request  = $this->validate_product($request);

        \DB::beginTransaction();
        try {

            $product = new Product();
            $product->fill($request->all()) ;
            $product->save();


            foreach ($request->input('categories') as $category )
            {
                $productCategory = new ProductCategory();
                $productCategory->product_id = $product->id ;
                $productCategory->category_id = $category ;
                $productCategory->save();
            }
            $this->store_history($product->id , 'ثبت اولیه') ;



        }
        catch ( \Exception $e )
        {
            \DB::rollBack();
            jerror("اشکال در انجام عملیات" );
        }

        \DB::commit();



        jok(['url'=>route('product.show.cp' ,['id'=>$product->id ])]);

    }

    function update(Request $request , $id ){


        $request  = $this->validate_product($request);

        $product = Product::findOrFail($id);

        \DB::beginTransaction();
        try {

            $product->fill($request->all()) ;
            $product->save();

            ProductCategory::where('product_id' , $product->id )->delete();

            foreach ($request->input('categories') as $category )
            {
                $productCategory = new ProductCategory();
                $productCategory->product_id = $product->id ;
                $productCategory->category_id = $category ;
                $productCategory->save();
            }

            $this->store_history($product->id , 'ویرایش') ;

        }
        catch ( \Exception $e )
        {
            \DB::rollBack();
            jerror("اشکال در انجام عملیات" );
        }

        \DB::commit();


        jok(['url'=>route('product.show.cp' ,['id'=>$product->id ])]);

    }


    private function validate_product( Request $request ){

        $whitelist = [
            'title' => ['rule' => 'required', 'title' => 'عنوان '],
            'image' => ['rule' => 'required|exists:uploads,token', 'title' => 'تصویر را آپلود کنید * '],
            'text' => ['rule' => 'required', 'title' => 'توضیحات کامل '],
            'jest' => ['rule' => 'required', 'title' => 'توضیحات کوتاه '],
            'price' => ['rule' => 'required|numeric', 'title' => 'قیمت '],
            'points' => ['rule' => 'required|numeric', 'title' => 'امتیاز '],
            'categories'=>['rule'=> 'required|array'  , 'title'=>'*دسته بندی را انتخاب کنید '],

        ];

        $validation = \Validator::make($request->all(), rule($whitelist));

        if ($validation->fails())
        {
            jerror($validation , $whitelist);
        }

        try
        {
            $image = Upload::where('token' , $request->input('image'))->first();
        }
        catch (\Exception $E )
        {
           jerror("اشکال در شناسایی تصویر آپلود شده");
        }

        $addons =  [
            'slug' => prep_url ('products' ,  $request  ) ,
            'image' =>  $image->file_name ,
            'upload_id' =>  $image->id
        ];

        foreach ($addons as $k=>$v )
            $request->request->add([ $k => $v  ]);

        return $request ;

    }

    function delete($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();
        $this->store_history($product->id , 'حذف') ;

        jok();

    }

    private function store_history( $id ,$title ){

        $productHistory = new ProductHistory();
        $productHistory->user_id = Auth::user()->id ;
        $productHistory->product_id = $id ;
        $productHistory->title = $title;
        $productHistory->data = Product::with('ProductCategory')->find($id)->toJson();
        $productHistory->save();

    }

}
