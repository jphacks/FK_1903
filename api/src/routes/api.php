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

Route::get('/sneaker', 'Api\SneakersController@index');
Route::post('/sneaker', 'Api\SneakersController@store');
Route::get('/sneaker/popular', 'Api\SneakersController@popular');
Route::get('/sneaker/lowest', 'Api\SneakersController@lowest');
Route::get('/sneaker/highest', 'Api\SneakersController@highest');
Route::get('/sneaker/{id}', 'Api\SneakersController@show');
Route::delete('/sneaker/{id}', 'Api\SneakersController@destroy');
