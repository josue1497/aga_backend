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
Route::resource('consultant', 'ConsultantController');
Route::resource('user', 'UserController');

Route::post('consultant/singin/', 'ConsultantController@singin');
Route::post('user/singin/', 'UserController@singin');


