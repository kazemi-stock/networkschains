<?php

namespace App\Traits ;
use App\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Kavenegar\Laravel\Facade;

trait Sms{

    static function send( $data  ){


        try{
            $sender = "10004346";
            $message = $data['text'];
            $receptor = array( $data['mobile']);
            $result = \Kavenegar\Laravel\Facade::Send($sender,$receptor,$message);
            if($result){
                foreach($result as $r){
                    echo "messageid = $r->messageid";
                    echo "message = $r->message";
                    echo "status = $r->status";
                    echo "statustext = $r->statustext";
                    echo "sender = $r->sender";
                    echo "receptor = $r->receptor";
                    echo "date = $r->date";
                    echo "cost = $r->cost";
                }
            }
        }
        catch(ApiException $e){
            // در صورتی که خروجی وب سرویس 200 نباشد این خطا رخ می دهد
            echo $e->errorMessage();
        }
        catch(HttpException $e){
            // در زمانی که مشکلی در برقرای ارتباط با وب سرویس وجود داشته باشد این خطا رخ می دهد
            echo $e->errorMessage();
        }


    }

}
