<?php

namespace App\Http\Middleware;

use Closure;

use Illuminate\Support\Facades\Auth;

class ApiToken
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        var_dump('中间件;ApiToken');

        if (Auth::guard('apitoken')->guest()) {//未设置Token
            return response()->json(['code' => 401, 'msg' => 'not set token']);
        }

       // p(Auth::guard('apitoken')->check());

        if (Auth::guard('apitoken')->check()) {//登录

            return response()->json(['code' => 200, 'msg' => 'set token']);
        }

        //// return $next($request);
        $response = $next($request);

        /*
                //验证token是否过期;过期则更新token
                $user = Auth::guard($guard)->user();
                if (isTimeGreater($user->updated_token_at)){
                    $response->header("api_token", $user->generateToken());
                }

        */


      return $response;
    }

    protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {
          //  return route('demo');
        }

        echo 'hello  apitoken; redirect;';exit;
    }



}
