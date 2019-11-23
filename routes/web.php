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


    Route::get('fun','LoginController@commonfunctiondemo');//公共方法测试
    Route::get('demoadminmodel','LoginController@demomodel');//模型方法调用测试
    Route::get('demoadminmodela','LoginController@demomodel_a');//模型方法调用测试

    Route::get('create', 'LoginController@create');//表单请求验证
    Route::post('store', 'LoginController@store');//表单请求验证

});


//数据库 测试;集合collection 测试
Route::prefix('database')->namespace('Admin')->group(function () {
    Route::get('insert', 'DatabaseController@insert');
    Route::get('get', 'DatabaseController@get');
    Route::get('get_w', 'DatabaseController@get_w');
    Route::get('collection', 'DatabaseController@demo_collection');
    Route::get('collect', 'DatabaseController@demo_collect');
    Route::get('array', 'DatabaseController@demo_array');
    Route::get('model', 'DatabaseController@get_m');
    Route::get('list', 'DatabaseController@get_lst');
});

//   https://juejin.im/post/5b5c14ba51882519d3467cac    Laravel5.6 实现后台管理登录(自定义用户表登录)




// api认证；

//  .../t?api_token=123456   //url地址
//  .../t                    //url地址
Route::group(['middleware' => ['auth.apitoken']], function () {
    Route::get('/t', function () {
        return 'web;ok';
    });
});

// http status
Route::get('/lang', 'Lang\HomeController@index') ;