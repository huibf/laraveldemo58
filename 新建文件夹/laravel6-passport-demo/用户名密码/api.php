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


// https://www.bilibili.com/video/av74879198?p=5
// laravel6 认证与授权（web、api、OAuth 2.0、passport）

/*
Route::get('/demo',function(){
    return 'demo';

});

Route::post('/demo',function(){
    return request()->all();
});

   Route::post('/oauth/token',function(){
    return 'sldsd';
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


*/


//获取access_token
 Route::post('/oauth/token','\Laravel\Passport\Http\Controllers\AccessTokenController@issueToken');

/*
 *  http://passportdemo65.test/api/register
 * body;form-data
 * name:huibf
 * email:1912079532qq.com
 * password:123456789
 * password_confirmation:123456789
 *
 *
 */
Route::post('/register', 'PassportController@register');


/*
 *  http://passportdemo65.test/api/login
 * body;form-data
 * email:1912079532qq.com
 * password:123456789
 *
 */
Route::post('/login', 'PassportController@login');


/*
 *  http://passportdemo65.test/api/refresh
 * body
 * refresh_token:{{refresh_token}}
 * {{refresh_token}} ; postman 创建的环境变量
 */
Route::post('/refresh', 'PassportController@refresh');

/*
 *  http://passportdemo65.test/api/logout
 * header
 * Accept:application/json
 * Content-Type:application/json
 * Authorization:Bearer {{access_token}}
 * {{access_token}} ; postman 创建的环境变量
 */
Route::post('/logout', 'PassportController@logout');


/*
 *  http://passportdemo65.test/api/test
 * header
 * Accept:application/json
 * Content-Type:application/json
 * Authorization:Bearer {{access_token}}
 * {{access_token}} ; postman 创建的环境变量
 */
Route::get('test',function(){
   // return 'ok';
    $user = auth::user();
    return $user;
})->middleware('auth');

