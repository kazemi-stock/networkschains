<?php

namespace App\Http\Controllers\Cp;

use App\Blog;
use App\BlogCategory;
use App\BlogDraft;
use App\BlogImage;
use App\Upload;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class BlogController extends Controller
{
    public function index(Request $request)
    {
        $query  = Blog::orderBy('id' , 'desc') ;
        if($request->input('title'))
            $query->where('title' , 'LIKE' , '%' . $request->input('title').'%');

        $blogs = $query->paginate(10);
        return view('cp.blog-index' , compact('blogs'));
    }

    public function make($id  = 0)
    {
        $edit = false ;
        $current_cats = [] ;
        $cond = ['user_id' => Auth::user()->id , 'blog_id'=>null ];
        if($id > 0)
        {
            $edit = Blog::findOrFail($id) ;
            $cond['blog_id'] = $edit->id ;
        }
        $draft = BlogDraft::where($cond)->first();

        return view('cp.blog-make' , ['draft'=>$draft , 'edit'=> $edit  , ]);
    }

    function draft_delete($id){
        $draft = BlogDraft::where('user_id' , Auth::user()->id)->findOrFail($id);
        $draft->delete();
        return redirect(  $draft->blog_id ? route('blog_create_cp' ,['id'=>$draft->blog_id]) : route('blog_create_cp') );
    }

    function draft(Request $request ,  $id){

        $blog = false ;
        $cond = ['user_id' => Auth::user()->id ];


        if($id > 0 )
        {
            $blog = Blog::find($id);
        }

        if($blog)
            $cond['blog_id'] = $blog->id ;




        if($request->input('text') && strlen($request->input('text')) > 3 )
        {
            $draft = BlogDraft::where($cond)->first();
            if(!$draft)
            {
                $draft = new BlogDraft();
                $draft->user_id  = Auth::user()->id ;
                $draft->blog_id = $blog ? $blog->id : null ;
            }
            $draft->text = $request->input('text');
            $draft->save();
        }

    }

    private function category_list( $parent_id = 0   , $stack = ''  , $current_cats = [] ){

        if($parent_id == 0 )
        {
            $categories = CategoryBlog::whereNull('parent_id')->get();
        }
        else
            $categories = CategoryBlog::where('parent_id' , $parent_id , $current_cats )->get();

        if($categories->isEmpty())
            return $stack ;

        $class = $parent_id == 0 ? 'parent' : 'child';
        $stack .="<ul  class='$class'>";



        foreach ( $categories as $category )
        {
            $checked  = in_array( $category->id , $current_cats )   ? 'checked' : '';

            $stack  .= "<li> <input class='ccheck' type='checkbox' value='$category->id' $checked> $category->title ";
            $stack  = $this->category_list($category->id ,  $stack , $current_cats) ;
            $stack  .= "</li>";
        }
        $stack .="</ul>";

        return $stack ;
    }


    public function save(Request $request , $id = 0 )
    {
        $whitelist = [
            'title'=>['rule'=> 'required'  , 'title'=>'عنوان '],
            'page_title'=>['rule'=> 'required'  , 'title'=>'عنوان صفحه '],
            'slug'=>['rule'=> 'present'  , 'title'=>'لینک '],
            'text'=>['rule'=> 'required'  , 'title'=>'توضیحات '],
            'suggested'=>['rule'=> 'required:in:0,1'  , 'title'=>'مقاله برتر '],
            'jest'=>['rule'=> 'required'  , 'title'=>'توضیح کوتاه '],
            'image'=>['rule'=> 'required'  , 'title'=>'تصویر اصلی را آپلود کنید * '],
            'banner'=>['rule'=> 'required'  , 'title'=>'تصویر هدر را آپلود کنید * '],
        ];
        $validation = \Validator::make($request->all(), rule($whitelist) );
        if($validation->fails())
            jerror($validation , $whitelist);

        $image = Upload::where('token' , $request->input('image'))->first();
        if(!$image)
            jerror("تصویر را آپلود کنید") ;

        $banner = Upload::where('token' , $request->input('banner'))->first();
        if(!$banner)
            jerror("تصویر هدر را آپلود کنید") ;

        if($request->input('publish_date'))
        {
            $publish_date = convert_date($request->input('publish_date') , 'Y-m-d' , false );
            $publish_date .= ' '.($request->input('publish_time'));
        }
        else
        {
            $publish_date = date('Y-m-d H:i:s');
        }

        if($id > 0 )
        {
            $blog  = Blog::findOrFail($id);
            if(!is_null($blog->publish_date) && strtotime($blog->publish_date) >= time() && strtotime($publish_date) < time())
            {
                jerror("تاریخ انتشار نمیتواند کمتر از تاریخ فعلی باشد!") ;
            }
        }
        else if( strtotime($publish_date) < time())
            jerror("تاریخ انتشار نمیتواند کمتر از تاریخ فعلی باشد!") ;


        $slug =   prep_url ('blogs' ,  $request  , $id );
        $check = Blog::where('slug' ,  $slug )->where('id' , '!=' , $id ) ->first();
        if($check)
            jerror("این لینک قبلا استفاده شده !");




        $blog  = Blog::findOrNew($id);
        $blog->title = $request->input('title');
        $blog->suggested = $request->input('suggested');
        $blog->page_title = $request->input('page_title');
        $blog->slug = $slug;
        $blog->jest = $request->input('jest');
        $blog->text = $request->input('text');
        $blog->description = $request->input('description');
        $blog->keywords = $request->input('keywords');
        $blog->url  = $slug;
        $blog->image = $image->file_name;
        $blog->image_upload_id = $image->id;

        $blog->banner = $banner->file_name;
        $blog->banner_upload_id = $banner->id;

        $blog->publish_date = $publish_date;
        $blog->save();

        BlogDraft::where('user_id' , Auth::user()->id )->delete();
        jok();
    }
    public function destroy(Request $request )
    {
        Blog::destroy($request['ids']);
        jok();
    }




//    --------------------------- category ---------------------------
    public function category_index($parent_id = null  )
    {
        if(!is_null($parent_id)  )
        {
            $parent = CategoryBlog::findOrFail($parent_id);
        }


        $category_line = category_line($parent_id , 'category_blogs');
        $caegories = CategoryBlog::where(['parent_id'=>$parent_id])->get();
        return view('cp.blog-category-index' , compact('caegories' , 'category_line' ,'parent_id' , 'level'));
    }

    public function category_create( $parent_id = 0  )
    {
        if($parent_id > 0 )
        {
            $parent = CategoryBlog::findOrFail($parent_id);
        }
        else
            $parent = false;

        return view('cp.blog-category-create' ,['edit'=>false , 'parent_id'=>$parent_id , 'parent'=>$parent]);
    }



    public function category_store(Request $request)
    {
        $whitelist = [
            'title'=>['rule'=> 'required'  , 'title'=>'عنوان '],
            'slug'=>['rule'=> 'present'  , 'title'=>'لینک '],
            'parent_id'=>['rule'=> 'required'  , 'title'=>'شناسه پدر '],
        ];


        $validation = \Validator::make($request->all(), rule($whitelist) );
        if($validation->fails())
            jerror($validation , $whitelist );

        if($request['parent_id'] > 0 )
        {
            $parent =   CategoryBlog::findOrFail($request['parent_id']);
        }


        $request['slug'] =   prep_url ('category_blogs' ,  $request  ,0 );
        $cat  = req_object( new CategoryBlog() , $request ,  $whitelist);



        $cat->save();
        jok();

    }

    public function category_edit($id)
    {
        $edit = CategoryBlog::findOrFail($id);
        $parent_id = $edit->parent_id;
        if($parent_id > 0 )
            $parent = CategoryBlog::findOrFail($parent_id);
        else
            $parent = false;


        return view('cp.blog-category-create' ,['edit'=>$edit , 'parent_id'=>$parent_id , 'parent'=>$parent]);
    }

    public function category_update(Request $request, $id)
    {
        $whitelist = [
            'title'=>['rule'=> 'required'  , 'title'=>'عنوان '],
            'slug'=>['rule'=> 'present'  , 'title'=>'لینک '],
        ];


        $validation = \Validator::make($request->all(), rule($whitelist) );
        if($validation->fails())
            jerror($validation , $whitelist );



        $request['slug'] =   prep_url ('categories' ,  $request  , $id );
        $edit = CategoryBlog::findOrFail($id);
        $cat  = req_object( $edit , $request ,  $whitelist);
        $cat->save();
        jok();
    }

    public function category_destroy(Request $request )
    {
        CategoryBlog::destroy($request['ids']);
        BlogCategory::whereIn('category_id' , $request['ids'])->delete();

        jok();
    }

}
