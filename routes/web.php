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

Route::get('/', function () {
    // date_default_timezone_set('America/Caracas');
    $timezone = date_default_timezone_get();
    $date = date('m/d/Y h:i:s a', time());
    return "Servidor Levantado, Zona Horaria: " . $timezone.", Fecha: ".$date;
});
