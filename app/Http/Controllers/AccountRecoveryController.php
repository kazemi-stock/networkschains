<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AccountRecoveryController extends Controller
{
    function index(){
        return view('auth.recover');
    }
}
