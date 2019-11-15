<?php

namespace App\Http\Middleware;

use Closure;


use Illuminate\Support\Facades\Auth;

class Adminauth
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
        /*
              $age = $request->demoage;
               $age = 450;// 测试数据
               if(isset($age)){
                   if ($age >= 150) {
                       echo '测试：路由中间件，DemoAge；age 有误<br>';
                       // exit;
                       // ren redirect('home');
                   }
               }

            */



        if (!Auth::guard('admin')->check()) {

            // echo '路由：adminauth；突出<br>';

            return redirect('/admin/login');

        }
        // echo '路由：adminauth<br>';

        return $next($request);
        /*
            $response = $next($request);

            // Perform action

            return $response;
        */
    }
}
