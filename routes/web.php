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
    return view('welcome');
});

 // Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


Route::prefix('admin')->namespace('Admin')->middleware(['demoage'])->group(function () {

    Route::get('index', 'LoginController@index');

});


Route::prefix('admin')->namespace('Admin')->middleware(['demoage'])->group(function () {
    Route::get('login', 'LoginController@loginform');  // 匹配 "/admin/login" 的 URL
    Route::post('login', 'LoginController@login');
});