<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    function InvoiceStock(){
        return $this->hasOne(InvoiceStock::class );
    }
    function InvoiceCredit(){
        return $this->hasOne(InvoiceCredit::class );
    }
}
