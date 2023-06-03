<?php

namespace App\Http\Controllers\Cp;

use App\BourseNews;
use App\Upload;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BourseController extends Controller
{
    public function index(Request $request)
    {
        $query  = BourseNews::orderBy('id' , 'desc') ;
        if($request->input('title'))
            $query->where('title' , 'LIKE' , '%' . $request->input('title').'%');

        $bourse_newses = $query->paginate(10);
        return view('cp.bourse-index' , compact('bourse_newses'));
    }

    public function make($id  = 0)
    {
        $edit = false ;
        $current_cats = [] ;
        if($id > 0)
        {
            $edit = BourseNews::findOrFail($id) ;
            $cond['blog_id'] = $edit->id ;
        }

        return view('cp.bourse-make' , [ 'edit'=> $edit  ]);
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
                $blog  = BourseNews::findOrFail($id);
            if(!is_null($blog->publish_date) && strtotime($blog->publish_date) >= time() && strtotime($publish_date) < time())
            {
                jerror("تاریخ انتشار نمیتواند کمتر از تاریخ فعلی باشد!") ;
            }
        }
        else if( strtotime($publish_date) < time())
            jerror("تاریخ انتشار نمیتواند کمتر از تاریخ فعلی باشد!") ;


        $slug =   prep_url ('bourse_news' ,  $request  , $id );
        $check = BourseNews::where('slug' ,  $slug )->where('id' , '!=' , $id ) ->first();
        if($check)
            jerror("این لینک قبلا استفاده شده !");




        $blog  = BourseNews::findOrNew($id);
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

        jok();
    }
    public function delete(Request $request )
    {
        BourseNews::destroy($request['ids']);
        jok();
    }




}
