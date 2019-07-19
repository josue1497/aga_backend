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
Route::post('consultant/singin/', 'ConsultantController@singin');
Route::post('consultant/consultant_balance/', 'ConsultantController@consultant_balance');


Route::resource('user', 'UserController');
Route::post('user/singin/', 'UserController@singin');
Route::post('user/admin_singin/', 'UserController@admin_singin');
Route::post('user/user_balance/', 'UserController@user_balance');


Route::resource('historyuser', 'HistoryUserController');
Route::post('historyuser/all_histories', 'HistoryUserController@all_histories');


Route::resource('consultanthistory', 'ConsultantHistoryController');
Route::post('consultanthistory/all_histories', 'ConsultantHistoryController@all_histories');







