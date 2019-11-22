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

        if (!Auth::guard('admin')->check()) {
            if ($request->ajax() || $request->wantsJson()) {
                return response('Unauthorized.', 401);
            } else {
                return redirect('/admin/login');
            }
            // echo '路由：adminauth；<br>';

        }

        // echo '公共的内容<br>';

        return $next($request);
        /*
            $response = $next($request);

            // Perform action

            return $response;
        */
    }
}
