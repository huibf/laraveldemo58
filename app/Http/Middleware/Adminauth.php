<?php

namespace App\Http\Middleware;

use Closure;

use Auth;

class Adminauth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
       if(!Auth::guard('admin')->check()){

           echo '路由：adminauth<br>';
       // return redirect('/admin/login');

       }

        return $next($request);
    }
}
