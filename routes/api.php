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

//  .../api/demo  //url地址
Route::get('/demo', function (Request $request) {
    return 'api;demo';
})->name('demo');


//  .../api/login  //url地址
Route::get('/login', function (Request $request) {
    return 'api;login ';
})->name('login');


//  .../api/t?api_token=123456   //users表 查找的记录；没有则login;
Route::middleware('auth:apitoken')->get('/t', function (Request $request) {
     // return 'ok；route; api';
     return $request->user();
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    // return $request->user();
    return 'api middleware;router';
});

