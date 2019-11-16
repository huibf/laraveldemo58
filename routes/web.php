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


 Route::prefix('admin')->namespace('Admin')->middleware(['adminauth'])->group(function () { //路由中间件作用户认证
// Route::prefix('admin')->namespace('Admin')->group(function () {//LogninController控制器的控制器中间件作用户认证
    Route::get('index', 'LoginController@index');

});


Route::prefix('admin')->namespace('Admin')->group(function () {
    Route::get('login', 'LoginController@loginform');  // 匹配 "/admin/login" 的 URL
    Route::post('login', 'LoginController@login');
    Route::get('loginout', 'LoginController@loginout');


    Route::get('create', 'LoginController@create');//表单验证
    Route::post('store', 'LoginController@store');//表单验证

});

//   https://juejin.im/post/5b5c14ba51882519d3467cac    Laravel5.6 实现后台管理登录(自定义用户表登录)