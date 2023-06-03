<?php

namespace App\Http\Controllers\Cp;

use App\CoolerType;
use App\CreditPackage;
use App\Setting;
use App\SettingNotification;
use App\TovSetting;
use App\ShopSlider;
use App\SiteBankAccount;
use App\Slider;
 use App\TovSlider;
use App\Upload;
use App\WorkingHour;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SettingController extends Controller
{

    function credit_package(){
         $packages = CreditPackage::all();
         return view('cp.setting-credit-package' , compact('packages'));
    }
    function credit_package_store(Request $request , $id  = 0  )
    {

        $whitelist = [
            'title'=>['rule'=> 'required'  , 'title'=>'عنوان '],
            'price'=>['rule'=> 'required|numeric|min:1'  , 'title'=>'قیمت '],
            'image'=>['rule'=> 'required'  , 'title'=>'تصویر اصلی را آپلود کنید * '],
        ];
        $validation = \Validator::make($request->all(), rule($whitelist) );
        if($validation->fails())
            jerror($validation , $whitelist);



        if(!$request->input('image'))
            jerror('تصویر را آپلود کنید') ;

        $upload = Upload::where('type' , 'image')->where('user_id' , Auth::user()->id )->where('token' , $request->input('image'))->firstOrFail();

        DB::beginTransaction();

        try{

            $package = CreditPackage::findOrNew($id);
            $package->title = $request->input('title') ;
            $package->price = $request->input('price') ;
            $package->image = $upload->file_name ;
            $package->upload_id = $upload->id ;
            $package->save();

        }
        catch (\Exception $e)
        {
            DB::rollback();
            jerror('اشکال در انجام عملیات' );
        }

        DB::commit();
        jok(['url'=>'current']);

    }

    function credit_package_delete($id){
        $p = CreditPackage::findOrFail($id);
        $p->delete();
        jok();
    }

    function slider(){
        $sliders = TovSlider::all();
         return view('cp.setting-slider' , compact('sliders'));
    }



    function slider_update(Request $request , $id  = 0  )
    {
         if(!$request->input('image'))
            jerror('تصویر را آپلود کنید') ;

        $upload = Upload::where('type' , 'image')->where('user_id' , Auth::user()->id )->where('token' , $request->input('image'))->firstOrFail();



        DB::beginTransaction();

        try{

            $slider = TovSlider::findOrNew($id);
            $slider->image = $upload->file_name ;
            $slider->upload_id = $upload->id ;
            $slider->save();

        }
        catch (\Exception $e)
        {
            DB::rollback();
            jerror('اشکال در انجام عملیات' );
        }

        DB::commit();
        jok();

        jok();
    }

    function notification(){
        error_reporting(0);
        $rows = SettingNotification::all();
        $settings = new \stdClass();
        foreach($rows as $s )
            $settings->{$s->key} = $s ;
        return view('cp.settings-notification' , compact('settings'   ));
    }

    function notification_update(Request $request){


        foreach ($request->input('data') as $data )
        {
            if(!isset($data['title']))
                jerror("عنوان همه موارد را وارد کنید") ;
            if(!isset($data['key']))
                jerror("کلید یافت نشد") ;

        }
        foreach ($request->input('data') as $data )
        {
            $not =  SettingNotification::firstOrNew(['key' =>$data['key']]);
            $not->key = $data['key'];
            $not->title = $data['title'];
            $not->text = $data['text'];
            $not->sms = $data['sms'];
            $not->email = $data['email'];
            $not->notification = $data['notification'];
            $not->save();
        }

        jok();

    }
    function index(){
        error_reporting(0);
        $rows = TovSetting::all();
        $settings = new \stdClass();
        foreach($rows as $s )
            $settings->{$s->key} = $s->val ;

        return view('cp.settings' , compact('settings'   ));
    }

    function update( Request $request ){
        if(!isset($request['arr']) || !is_array($request['arr']) || empty($request['arr']))
            jerror('اطلاعات ارسال شده قابل قبول نمیبیاشد ');
        $data = [];
        foreach ($request['arr'] as $k=>$v)
        {
            if(!is_array($v) || !isset($v['key']) || !isset($v['val']))
                continue;

            $data[] = ['key'=>trim($v['key']) , 'val'=>trim($v['val'])];
        }

        if(empty($data))
            jerror('اطلاعاتی ارسال نشد');

        DB::beginTransaction();

        try{
            TovSetting::getQuery()->delete();
            TovSetting::insert($data);

        }
        catch (\Exception $e)
        {
            DB::rollback();
            jerror('اشکال در انجام عملیات' );
        }

        DB::commit();
        jok();

    }


    function slider_delete($id)
    {
        $w = TovSlider::findOrFail($id);
        $w->delete();
        jok();
    }
}
