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


//  .../api/t?api_token=123456   //users表 查找的记录；没有则login; 路由中间件
Route::middleware('auth:apitoken')->get('/t', function (Request $request) {
    // return 'ok；route; api';
    return $request->user();
});


//  api版本控制
// .../v1/api/user
Route::prefix('v1')->get('user', function (Request $request) {

    // return $request->user();
    return 'v1 api user;router';
});


//  .../v2/api/user?api_token=123456
Route::prefix('v2')->middleware('auth:apitoken')->get('/user', function (Request $request) {

    return 'v2 api user; middleware;router';
});



//路由分组

//  .../api/v3/user
Route::prefix('v3')->group(function () {

    Route::get('user', function () {
        return 'v3 api user;router'; // 匹配包含 "" 的 URL
    });

    Route::get('usera', function () {
        return 'v3 api usera;router'; // 匹配包含 "" 的 URL
    });

});


//  .../api/v4/user?api_token=123456
Route::prefix('v4')->middleware('auth:apitoken')->group(function () {

    Route::get('user', function () {
        return 'v4 api user; middleware; router'; // 匹配包含 "" 的 URL
    });

    Route::get('usera', function () {
        return 'v4 api usera;middleware;router'; // 匹配包含 "" 的 URL
    });

});
