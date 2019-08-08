<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

//Agregamos nuestra ruta al controller de Test
Route::resource('role', 'RoleController');

Route::resource('career', 'CareerController');
Route::post('career/consultants', 'CareerController@consultants');


Route::resource('consultant', 'ConsultantController');
Route::post('consultant/singin/', 'ConsultantController@singin')->name('consultant.singin');
Route::post('consultant/consultant_balance/', 'ConsultantController@consultant_balance')->name('consultant.consultant_balance');
Route::post('consultant/all_consultants/', 'ConsultantController@all_consultants')->name('consultant.all_consultants');


Route::resource('user', 'UserController');
Route::post('user/singin/', 'UserController@singin')->name('user.singin');
Route::post('user/admin_singin/', 'UserController@admin_singin')->name('user.admin_singin');
Route::post('user/user_balance/', 'UserController@user_balance')->name('user.user_balance');


Route::resource('historyuser', 'HistoryUserController');
Route::post('historyuser/all_histories', 'HistoryUserController@all_histories');


Route::resource('consultanthistory', 'ConsultantHistoryController');
Route::post('consultanthistory/all_histories', 'ConsultantHistoryController@all_histories');

Route::resource('deposit', 'DepositController');
Route::post('deposit/upload', 'DepositController@upload');


Route::resource('balance_user', 'BalanceUserController');
Route::post('balance_user/get_balance', 'BalanceUserController@get_balance');

Route::resource('transaction_user', 'TransactionUserController');
Route::post('transaction_user/all_transactions', 'TransactionUserController@all_transactions');


Route::resource('dating', 'DatingController');
Route::post('dating/datings_by_consultant', 'DatingController@datings_by_consultant');
Route::post('dating/datings_by_user', 'DatingController@datings_by_user');
Route::post('dating/response_request', 'DatingController@response_request');
Route::post('dating/cancelled_dating', 'DatingController@cancelled_dating');


Route::resource('balance_consultant', 'BalanceConsultantController');
Route::post('balance_consultant/get_balance', 'BalanceConsultantController@get_balance');










