<?php

namespace App\Http\Controllers\Cp;

use App\Page;
use App\ShopPage;
use App\TovPage;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PageController extends Controller
{
        function index(){
            $pages = TovPage::all();
            return view('cp.page-index' , compact('pages'));
        }

        function create(){
            return view('cp.page-create');
        }

        function store(Request $request){

            $this->validate_page($request);

            $slug  =   prep_url ('tov_pages' ,  $request  );
            $page = new TovPage();
            $page->title = $request->input('title');
            $page->text = $request->input('text');
            $page->slug = $slug ;
            $page->save();
            jok(['url'=>route('cp_page_index')]);
        }
        private function validate_page( Request $request ){

            $whitelist = [
                'title' => ['rule' => 'required', 'title' => 'عنوان '],
                'text' => ['rule' => 'required', 'title' => 'متن '],

            ];

            $validation = \Validator::make($request->all(), rule($whitelist));

            if ($validation->fails())
            {
                jerror($validation , $whitelist);
            }

        }

        function edit( $id ){

            $page = TovPage::findOrFail($id);
            return view('cp.page-edit' , compact('page'));

        }

    function update(Request $request , $id ){
        $page = TovPage::findOrFail($id);

        $this->validate_page($request);
        $slug  =   prep_url ('tov_pages' ,  $request , $id   );


        $page->title = $request->input('title');
        $page->text = $request->input('text');
        $page->slug = $slug ;
        $page->save();
        jok(['url'=>route('cp_page_index')]);
    }

    function delete(Request $request){

            TovPage::destroy($request->input('ids')[0]);
            jok();

    }


}
