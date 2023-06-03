<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::group([ 'prefix'=>'cp' ,  'namespace'=>'Cp' ,  'middleware'=>['auth' ,'admin'  ] ], function() {

    Route::get('/', 'IndexController@index')->name('cp_index');
    Route::post('/upload/image', 'IndexController@upload_image')->name('cp_upload_image');
    Route::post('/notifications', 'IndexController@notifications')->name('cp_notifications');

    Route::get('/category/{id?}', 'CategoryController@index')->name('cp_category_index');


    Route::get('/category/create/{parent_id?}' , 'CategoryController@create' )->name('category_create_cp');

    Route::get('/category/edit/{id?}' , 'CategoryController@edit' )->name('category_edit_cp');
    Route::post('/category/store' , 'CategoryController@store')->name('category_store');
    Route::post('/category/update/{id}' , 'CategoryController@update')->name('category_update');
    Route::post('/category/destroy' , 'CategoryController@destroy')->name('category_destroy_cp');
    Route::post('/category/children/{id?}' , 'CategoryController@children' )->name('category_children_cp');


    Route::get('/course', 'CourseController@index')->name('cp_course_index');
    Route::get('/course/show/{id}', 'CourseController@show')->name('cp_course_show');
    Route::post('/course/confirm/{id}', 'CourseController@confirm')->name('cp_course_confirm');

    Route::get('/user', 'UserController@index')->name('cp_user_index');
    Route::get('/user/create', 'UserController@create')->name('cp_user_create');
    Route::post('/user/store', 'UserController@store')->name('cp_user_store');
    Route::get('/user/{id}', 'UserController@show')->name('cp_user_show');
    Route::get('/user/make', 'UserController@make')->name('cp_user_make');
    Route::post('/user/confirm/reponse', 'UserController@confirm_response')->name('cp_profile_confirm_response');

    Route::post('/user/update/profile/{id}', 'UserController@update_profile')->name('cp_update_profile');
    Route::post('/user/update/user/{id}', 'UserController@update_user')->name('cp_update_user');
    Route::post('/user/update/password/{id}', 'UserController@update_password')->name('cp_update_password');
    Route::post('/user/update/bankwallet/{id}', 'UserController@update_bank_wallet')->name('cp_update_bank_wallet');
    Route::post('/user/update/role/{id}', 'UserController@update_role')->name('cp_update_user_role');

    Route::get('/ticket', 'TicketController@index')->name('cp_ticket_index');
    Route::post('/ticket/store/{id}', 'TicketController@store')->name('cp_save_ticket');
    Route::post('/ticket/store/replay/{id}', 'TicketController@store_replay')->name('cp_ticket_store_replay');
    Route::get('/ticket/show/{id}', 'TicketController@show')->name('cp_show_ticket');



    Route::get('/transaction', 'TransactionController@index')->name('cp_transaction_index');

    Route::get('/withdraw', 'TransactionController@withdraw_index')->name('cp_withdraw_index');
    Route::get('/withdraw/result/create/{id}', 'TransactionController@withdraw_result_create')->name('withdraw_result_create');
    Route::post('/withdraw/result/store/{id}', 'TransactionController@withdraw_result_store')->name('withdraw_result_store');

    Route::get('/setting', 'SettingController@index')->name('cp_setting_index');
    Route::post('/setting/update', 'SettingController@update')->name('cp_setting_update');
    Route::get('/setting/bank/account', 'SettingController@bank_accounts')->name('cp_setting_bank_account');
    Route::post('/setting/bank/account/store', 'SettingController@bank_account_store')->name('cp_setting_bank_account_store');
    Route::post('/setting/bank/account/update/{id}', 'SettingController@bank_account_update')->name('cp_setting_bank_account_update');
    Route::post('/setting/bank/account/delete', 'SettingController@bank_account_delete')->name('cp_setting_bank_account_delete');

    Route::get('/page', 'PageController@index')->name('cp_page_index');
    Route::get('/page/create', 'PageController@create')->name('cp_page_create');
    Route::post('/page/store', 'PageController@store')->name('cp_page_store');
    Route::get('/page/edit/{id}', 'PageController@edit')->name('cp_page_edit');
    Route::post('/page/update/{id}', 'PageController@update')->name('cp_page_update');
    Route::post('/page/delete', 'PageController@delete')->name('cp_page_delet');



});


Route::group([ 'middleware'=>['client' ] ], function() {


        Route::group([ 'middleware'=>['auth' ] ], function() {


            Route::post('/upload', 'UploadController@upload')->name('dashboard_upload');
            Route::post('/upload/image', 'UploadController@upload_image')->name('dashboard_upload_image');
            Route::post('/upload/video', 'UploadController@upload_video')->name('dashboard_upload_video');



            Route::get('/notification', 'DashboardController@notification')->name('profile_notification');
            Route::post('/notification/delete/{id}', 'DashboardController@notification_delete')->name('profile_notification_delete');
            Route::get('/profile', 'DashboardController@profile')->name('profile');
            Route::get('/profile/edit', 'DashboardController@profile_edit')->name('profile_edit');
            Route::post('/profile/image/update', 'DashboardController@profile_image_update')->name('profile_image_update');
            Route::post('/profile/update', 'DashboardController@update')->name('profile_update');
            Route::post('/profile/password/update', 'DashboardController@update_password')->name('profile_password_update');
            Route::get('/profile/ticket', 'DashboardController@ticket_index')->name('profile_ticket_index');
            Route::post('/profile/ticket/send', 'DashboardController@ticket_send')->name('profile_ticket_send');
            Route::post('/profile/ticket/replay/send/{id}', 'DashboardController@ticket_reply_send')->name('profile_ticket_reply_send');
            Route::get('/profile/ticket/show/{id}', 'DashboardController@ticket_show')->name('profile_ticket_show');
            Route::post('/profile/ticket/send/teacher/{id}', 'DashboardController@ticket_send_teacher')->name('profile_ticket_send_teacher');

            Route::post('/channel/post/{id}/comment/store', 'ChannelController@comment_store')->name('channel_comment_store');
            Route::post('/channel/post/{id}/comment/like', 'ChannelController@comment_like')->name('channel_comment_like');

            Route::get('/quiz/{id}/course/init', 'QuizController@course_init')->name('quiz_course_init');
            Route::post('/quiz/{id}/course/save', 'QuizController@course_save')->name('quiz_course_save');
            Route::get('/quiz/{id}/course/result', 'QuizController@course_result')->name('quiz_course_result');



            Route::group(['prefix' => 'dashboard/instructor'], function () {


                Route::get('/shop', 'ShopDashboardController@index')->name('dashboard_shop_index');
                Route::get('/shop/create', 'ShopDashboardController@create')->name('dashboard_shop_create');
                Route::post('/shop/store', 'ShopDashboardController@store')->name('dashboard_shop_store');
                Route::get('/shop/edit', 'ShopDashboardController@edit')->name('dashboard_shop_edit');
                Route::post('/shop/update', 'ShopDashboardController@update')->name('dashboard_shop_update');
                Route::get('/shop/product', 'ShopDashboardController@product_index')->name('dashboard_shop_product_index');
                Route::get('/shop/product/create', 'ShopDashboardController@product_create')->name('dashboard_shop_product_create');
                Route::post('/shop/product/store', 'ShopDashboardController@product_store')->name('dashboard_shop_product_store');
                Route::get('/shop/product/{id}/edit', 'ShopDashboardController@product_edit')->name('dashboard_shop_product_edit');
                Route::post('/shop/product/{id}/update', 'ShopDashboardController@product_update')->name('dashboard_shop_product_update');
                Route::post('/shop/product/{id}/delete', 'ShopDashboardController@product_delete')->name('dashboard_shop_product_delete');


                Route::get('/profile', 'DirectController@profile')->name('dashboard_teacher_profile');

                Route::group([ 'middleware'=>['teacher' ] ], function() {
                    Route::get('/ticket/direct', 'DirectController@index')->name('dashboard_direct_index');
                    Route::get('/ticket/direct/show/{id}', 'DirectController@show')->name('dashboard_direct_show');
                    Route::post('/ticket/direct/reply/{id}', 'DirectController@reply')->name('dashboard_direct_reply');
                    Route::get('/performance', 'DirectController@performance')->name('dashboard_teacher_performance');
                });

                Route::post('/profile/update', 'DashboardController@update_profile_teacher')->name('update_profile_teacher');

                Route::get('/course/index', 'CourseDashboardController@index')->name('dashboard_course_index');
                Route::get('/course/create', 'CourseDashboardController@create')->name('dashboard_course_create');
                Route::post('/course/delete/{id}', 'CourseDashboardController@delete')->name('dashboard_course_delete');
                Route::get('/course/cupon/{id}', 'CourseDashboardController@cupon_index')->name('dashboard_course_cupon_index');
                Route::post('/course/cupon/{id}/store', 'CourseDashboardController@cupon_store')->name('dashboard_course_cupon_store');
                Route::post('/course/cupon/{id}/delete', 'CourseDashboardController@cupon_delete')->name('dashboard_course_cupon_delete');

                Route::get('/course/preview/{id}', 'CourseDashboardController@preview')->name('dashboard_course_preview');
                Route::post('/course/publish/{id}', 'CourseDashboardController@publish')->name('dashboard_course_publish');
                Route::post('/course/subcategory', 'CourseDashboardController@subcategory')->name('dashboard_course_subcategory');

                Route::post('/course/upload/preview/image/{id}', 'CourseDashboardController@upload_preview_image')->name('dashboard_course_upload_preview');
                Route::post('/course/upload/intro/video/{id}', 'CourseDashboardController@upload_intro_video')->name('dashboard_course_upload_intro');

                Route::post('/course/init', 'CourseDashboardController@init')->name('course_init');
                Route::get('/course/{id}/manage/{type?}', 'CourseDashboardController@manage')->name('course_manage');
                Route::post('/course/{id}/update/target', 'CourseDashboardController@update_target')->name('update_course_target');
                Route::post('/course/{id}/section/create', 'CourseDashboardController@create_section')->name('course_create_section');
                Route::post('/course/{id}/section/update', 'CourseDashboardController@update_section')->name('course_update_section');
                Route::post('/course/lecture/store/{type}/{id?}', 'CourseDashboardController@lecture_store')->name('course_lecture_store');
                Route::post('/course/lecture/{id}/update/title', 'CourseDashboardController@lecture_title_update')->name('course_lecture_title_update');
                Route::post('/course/lecture/{id}/video/store', 'CourseDashboardController@lecture_video_store')->name('course_lecture_video_store');
                Route::post('/course/lecture/{id}/resource/store', 'CourseDashboardController@lecture_resource_store')->name('course_lecture_resource_store');
                Route::post('/course/lecture/{id}/resource/delete', 'CourseDashboardController@lecture_resource_delete')->name('course_lecture_resource_delete');

                Route::post('/course/section/{id}/sort', 'CourseDashboardController@course_section_sort')->name('course_section_sort');
                Route::post('/course/lecture/{id}/sort', 'CourseDashboardController@course_lecture_sort')->name('course_lecture_sort');


                Route::post('/course/lecture/{id}/store/quiz', 'CourseDashboardController@lecture_quiz_store')->name('course_lecture_store_quiz');
                Route::post('/course/lecture/{id}/update/quiz', 'CourseDashboardController@lecture_quiz_update')->name('course_lecture_update_quiz');
                Route::post('/course/lecture/{id}/store/quiz/question', 'CourseDashboardController@lecture_quiz_store_question')->name('course_lecture_store_quiz_question');
                Route::post('/course/lecture/{id}/update/quiz/question/{lecture}', 'CourseDashboardController@lecture_quiz_update_question')->name('course_lecture_update_quiz_question');
                Route::post('/course/section/delete/{id}', 'CourseDashboardController@section_delete')->name('section_delete');
                Route::post('/course/lecture/delete/{id}', 'CourseDashboardController@lecture_delete')->name('lecture_delete');
                Route::post('/course/lecture/quiz/question/delete/{id}', 'CourseDashboardController@quiz_question_delete')->name('quiz_question_delete');
                Route::get('/course/discussion/{id}', 'CourseDashboardController@discussion')->name('course_discussion');
                Route::post('/course/discussion/{id}/responde', 'CourseDashboardController@discussion_responde')->name('course_discussion_responde');

                Route::get('/channel/create', 'ChannelDashboardController@create')->name('channel_create');
                Route::post('/channel/upload', 'ChannelDashboardController@upload')->name('channel_upload');
                Route::post('/channel/upload/video', 'ChannelDashboardController@upload_video')->name('channel_upload_video');
                Route::post('/channel/upload/image', 'ChannelDashboardController@upload_image')->name('channel_upload_image');
                Route::post('/channel/store', 'ChannelDashboardController@store')->name('channel_store');



                Route::group(['middleware' => ['channel']], function () {
                    Route::get('/channel', 'ChannelDashboardController@index')->name('dashboard_channel_index');
                    Route::get('/channel/edit', 'ChannelDashboardController@edit')->name('dashboard_channel_edit');
                    Route::post('/channel/update', 'ChannelDashboardController@update')->name('dashboard_channel_update');

                    Route::get('/channel/post/create', 'ChannelDashboardController@post_create')->name('channel_post_create');
                    Route::post('/channel/post/store', 'ChannelDashboardController@post_store')->name('channel_post_store');
                    Route::post('/channel/post/update/{id}', 'ChannelDashboardController@post_update')->name('channel_post_update');
                    Route::get('/channel/post/edit/{id}', 'ChannelDashboardController@post_edit')->name('channel_post_edit');
                    Route::post('/channel/post/delete/{id}', 'ChannelDashboardController@post_delete')->name('channel_post_delete');
                });

                Route::get('/class', 'SeminarDashboardController@index')->name('dashboard_seminar_index');
                Route::get('/class/create', 'SeminarDashboardController@create')->name('dashboard_seminar_create');
                Route::post('/class/upload', 'SeminarDashboardController@upload')->name('dashboard_seminar_upload');
                Route::post('/class/upload/image', 'SeminarDashboardController@upload_image')->name('dashboard_seminar_upload_image');
                Route::post('/class/store', 'SeminarDashboardController@store')->name('dashboard_sminar_store');
                Route::post('/class/delete/{id}', 'SeminarDashboardController@delete')->name('dashboard_seminar_delete');
                Route::get('/class/edit/{id}', 'SeminarDashboardController@edit')->name('dashboard_seminar_edit');
                Route::post('/class/update/{id}', 'SeminarDashboardController@update')->name('dashboard_sminar_update');
                Route::get('/class/gallery/{id}', 'SeminarDashboardController@gallery')->name('dashboard_sminar_gallery');
                Route::post('/class/gallery/update/{id}', 'SeminarDashboardController@gallery_update')->name('dashboard_sminar_gallery_update');

                Route::get('/class/quiz/{id}', 'SeminarDashboardController@quiz')->name('dashboard_sminar_quiz');
                Route::post('/class/quiz/store/{id}', 'SeminarDashboardController@quiz_store')->name('dashboard_sminar_quiz_store');


            });


            // course

            Route::get('/course/video/{section_id}/{video_id}', 'CourseController@video')->name('course_video_show');
            Route::get('/course/resource/{id}/download', 'CourseController@download_resource')->name('course_download_resource');
            Route::post('/course/discussion/{course_id}/store', 'CourseController@discussion_store')->name('course_discussion_store');
            Route::post('/course/{id}/buy', 'CourseController@buy')->name('course_buy');


        });

        Auth::routes();

        Route::get('/', 'HomeController@index')->name('home');
        Route::get('/brows/{category?}', 'BrowsController@index')->name('brows_courses');
        Route::get('/course/show/{id}', 'CourseController@show')->name('course_show');
        Route::get('/teacher/{id}', 'CourseController@teacher_show')->name('tacher_show');
        Route::get('/channel', 'ChannelController@index')->name('channel_index');
        Route::get('/channel/{id}/post', 'ChannelController@post')->name('channel_post_show');
        Route::get('/teacher', 'TeacherController@index')->name('teacher_index');

});

