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

// url地址待研究

//  api/demo
Route::get('/demo', function (Request $request) {
    return 'apitoken;demo';
})->name('demo');



Route::middleware('auth:apitoken')->get('/t', function (Request $request) {
    // return $request->user();
    return 'apitoken;ok';
});

Route::middleware('auth:apitoken')->get('/user', function (Request $request) {
    // return $request->user();
    return 'apitoken; middleware;router';
});

