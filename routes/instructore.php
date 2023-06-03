<?php





Route::group([ 'middleware'=>['teacher' ] ], function() {
    Route::get('/ticket/direct', 'DirectController@index')->name('dashboard_direct_index');
    Route::get('/ticket/direct/show/{id}', 'DirectController@show')->name('dashboard_direct_show');
    Route::post('/ticket/direct/reply/{id}', 'DirectController@reply')->name('dashboard_direct_reply');
    Route::get('/performance', 'DirectController@performance')->name('dashboard_teacher_performance');
});






?>