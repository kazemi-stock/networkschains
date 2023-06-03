<?php

namespace App\Traits ;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\ImageManagerStatic as Image;

trait Upload{

    static function upload_path (){
        if(env('APP_DEBUG') === false )
            return str_replace('laravel', 'public_html/', base_path() . '/assets/upload' );
        else
            return str_replace('laravel', '', base_path() . '/assets/upload' );

    }

    static function upload_image(Request $request){

        $whitelist = [
            'files' => ['rule' => 'required|image|between:1,3000|mimes:jpeg,gif,png', 'title' => 'عکس آپلود شده '],
        ];

        $validation = \Validator::make($request->all(), rule($whitelist));

        if ($validation->fails())
            return ['stat'=>'er' , 'msg'=>  "تصویر آپلود شده قابل قبول نمیباشد لطفا حداکثر تا 3 مگابایت و با فرمت های jpg , png آپلود شود"] ;


        $format  = $request->file('files')->getClientOriginalExtension();
        $original_name    = $request->file('files')->getClientOriginalName();

        $default_name = uniqid() . 'D.' . $format;
        $after_name = uniqid().'N.'.$format ;


        try {
            $res =  $request->file('files')->move( self::upload_path()  , $default_name);
        }
        catch (\Exception $e  )
        {
            return ['stat'=>'er' , 'msg'=>'اشکال در انجا عملیات'] ;
        }

        $img = Image::make( self::upload_path() . "/$default_name");

        $img->save( self::upload_path() . "/$after_name");
        $img->destroy();
        unlink( self::upload_path() . "/$default_name");


        $upload = new \App\Upload();
        $upload->file_name = $after_name ;
        $upload->type = 'image';
        $upload->original_name = $original_name ;
        $upload->user_id = Auth::user() ? Auth::user()->id  : null ;
        $upload->token = uniqid();
        $upload->save();

        return ['stat'=>'ok' , 'upload'=> $upload ] ;


    }


}
