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

/// delete -> student_course_bought


Route::get('/services', function () {
    return view('services');
})->name('services');

Route::group(['prefix' => 'cp', 'namespace' => 'Cp', 'middleware' => ['auth', 'admin']], function () {

    Route::get('/tttt', 'CommissionController@user_pool_update');


    Route::get('/', 'HomeController@index')->name('cp_index');
    Route::post('/add_point/{uid?}', 'HomeController@add_point')->name('cp.test.addpoint');
    Route::post('/notifications', 'IndexController@notifications')->name('cp_notifications');


    Route::get('/withdraw', 'WithdrawController@index')->name('cp.withdraw');
    Route::post('/withdraw/success/store/{id}', 'WithdrawController@success_store')->name('cp.withdraw.success.store');

    Route::get('/crypto', 'CryptoController@index')->name('cp.crypto');
    Route::get('/crypto/response/create/{id}', 'CryptoController@response_create')->name('cp.crypto.response.create');
    Route::post('/crypto/response/store/{id}', 'CryptoController@response_store')->name('cp.crypto.response.store');

    Route::get('/commission', 'CommissionController@index')->name('cp.commission');
    Route::get('/commission/create/general', 'CommissionController@create_general')->name('cp.commission.create.general');
    Route::post('/commission/store/general', 'CommissionController@store_general')->name('cp.commission.store.general');
    Route::get('/commission/confirm/general/{id}', 'CommissionController@confirm_general')->name('cp.commission.confirm.general');
    Route::post('/commission/confirm/store/general/{id}', 'CommissionController@confirm_general_store')->name('cp.commission.confirm.general.store');
    Route::get('/commission/show/{id}', 'CommissionController@show')->name('cp.commission.show');

    Route::get('/commission/create/professional', 'CommissionController@create_professional')->name('cp.commission.create.professional');
    Route::post('/commission/store/professional', 'CommissionController@store_professional')->name('cp.commission.store.professional');
    Route::get('/commission/confirm/professional/{id}', 'CommissionController@confirm_professional')->name('cp.commission.confirm.professional');
    Route::post('/commission/confirm/store/professional/{id}', 'CommissionController@confirm_professional_store')->name('cp.commission.confirm.professional.store');
    Route::post('/commission/ethereum/balance', 'CommissionController@eth_balance')->name('cp.commission.ethereum.balance');

    Route::post('/log/comission/balance/{com_id}/{user_id}', 'UserController@com_balance_log')->name('cp.user.commission.balance.log');

    Route::get('/user', 'UserController@index')->name('cp_user_index');
    Route::get('/user/unconfirmed', 'UserController@index_unconfirmed')->name('cp.user.unconfirmed');
    Route::post('/user/confirm/{id}/store', 'UserController@confirm_store')->name('cp.user.unconfirmed.confirm.store');
    Route::get('/user/{id}', 'UserController@show')->name('cp_user_show');
    Route::post('/user/pool/update/{id}', 'UserController@pool_update')->name('cp.user.pool.update');
    Route::post('/user/position/update/{id}', 'UserController@position_update')->name('cp.user.position.update');


    Route::get('/isb/investment/index', 'UserController@invest_index')->name('cp.invest.index');
    Route::get('/isb/investment/deposit', 'UserController@invest_deposit')->name('cp.invest.deposit');
    Route::post('/isb/investment/deposit/approve', 'UserController@invest_deposit_approve')->name('cp.invest.deposit.approve');
    Route::post('/isb/investment/deposit/confirm', 'UserController@invest_deposit_confirm')->name('cp.invest.deposit.confirm');
    Route::get('/isb/investment/withdraw', 'UserController@invest_withdraw')->name('cp.invest.withdraw');
    Route::post('/isb/investment/withdraw/approve', 'UserController@invest_withdraw_approve')->name('cp.invest.withdraw.approve');
    Route::post('/isb/investment/withdraw/confirm', 'UserController@invest_withdraw_confirm')->name('cp.invest.withdraw.confirm');
    Route::post('/isb/investment/withdraw/hash', 'UserController@invest_withdraw_hash')->name('cp.invest.withdraw.hash');

});


Route::group(['middleware' => ['client']], function () {


    Auth::routes();

    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/', 'HomeController@index')->name('home');
    Route::get('/sitemap/create', 'HomeController@create_site_map');
    Route::get('/page/{slug}', 'HomeController@page')->name('page_show');


    Route::group(['middleware' => ['auth']], function () {

        Route::get('/verfy/email/require', 'HomeController@require_verify_email')->name('require.verfy.email');
        Route::post('/verfy/email/resend', 'HomeController@resend_verify_email')->name('resend.verfy.email');
        Route::get('/verfy/email/{id}/{token}', 'HomeController@verify_email')->name('verfy.email');

        Route::group(['middleware' => ['emailverified']], function () {


            Route::get('/invest/index', 'DashboardController@invest_index')->name('dashboard.invest.index');
            Route::get('/invest/deposit', 'DashboardController@invest_deposit')->name('dashboard.invest.deposit');
            Route::post('/invest/deposit/store', 'DashboardController@invest_deposit_store')->name('dashboard.invest.deposit.store');
            Route::post('/invest/deposit/convert', 'DashboardController@invest_deposit_convert')->name('dashboard.invest.deposit.convert');
            Route::post('/invest/get/profit', 'DashboardController@invest_get_profit')->name('dashboard.invest.get.profit');

            Route::get('/deposit', 'DashboardController@deposit')->name('dashboard.deposit');
            Route::get('/third-party-login', 'DashboardController@thirdPartyLogin')->name('dashboard.thirdPartyLogin');
            Route::post('/deposit/store', 'DashboardController@deposit_store')->name('dashboard.deposit.store');


            Route::group(['middleware' => ['confirmed'], 'prefix' => 'dashboard'], function () {

                Route::get('/position/create', 'DashboardController@position_create')->name('dashboard.position.create');
                Route::post('/position/store', 'DashboardController@position_store')->name('dashboard.position.store');
                Route::post('/position/save/register', 'DashboardController@position_save')->name('dashboard.position.save');


                Route::group(['middleware' => ['dashboard']], function () {


                    Route::get('/', 'DashboardController@index')->name('dashboard.index');
                    Route::get('/withdraw', 'DashboardController@withdraw')->name('dashboard.withdraw');
                    Route::post('/withdraw/store', 'DashboardController@withdraw_store')->name('dashboard.withdraw.store');
                    Route::post('/child/tree', 'DashboardController@children_tree')->name('dashboard.child.tree');


                    Route::get('/point/create', 'DashboardController@point_create')->name('dashboard.wallet.point.create');
                    Route::post('/point/buy', 'DashboardController@point_buy')->name('dashboard.wallet.point.buy');

                    Route::get('/wallet', 'DashboardController@wallet')->name('dashboard.wallet');
                    Route::post('/wallet/store', 'DashboardController@wallet_store')->name('dashboard.wallet.store');

                    Route::get('/commission', 'DashboardController@commission')->name('dashboard.commission');


                });
            });

        });
    });
    Route::get('/confirm/waiting', 'DashboardController@waiting')->name('confirm.waiting');

});





