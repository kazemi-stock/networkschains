<?php

namespace App\Http\Controllers\Cp;

use App\Faq;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FaqController extends Controller
{
    function index(){
        $faqs = Faq::orderBy('id' , 'desc')->get();
        return view('cp.faq-index' , compact('faqs'));
    }
    function store(Request $request){

        $whitelist =
            [
                'title' => ['rule' => 'required', 'title' => 'عنوان '],
                'text' => ['rule' => 'required', 'title' => 'توضیحات '],
            ];

        $validation = \Validator::make($request->all(), rule($whitelist));
        if ($validation->fails())
            jerror($validation , $whitelist);

        $faq = new Faq();
        $faq->title= $request->input('title');
        $faq->text= $request->input('text');
        $faq->save();

        jok(['html'=>$this->index()->render()]);

    }
    function delete(Request $request , $id )
    {
        $faq = Faq::findOrFail($id);
        $faq->delete();
        jok();
    }

    function update(Request $request , $id ){
        $faq = Faq::findOrFail($id);

        $whitelist = [
            'title' => ['rule' => 'required', 'title' => 'عنوان '],
            'text' => ['rule' => 'required', 'title' => 'توضیحات '],
        ] ;

        $validation = \Validator::make($request->all(), rule($whitelist));
        if ($validation->fails())
            jerror($validation , $whitelist);

        $faq->title= $request->input('title');
        $faq->text= $request->input('text');
        $faq->save();

        jok(['html'=>$this->index()->render()]);

    }

}
