<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests\Admin\Login;

class LoginController extends Controller
{

    public function __construct()
    {
        // $this->middleware('adminauth')->except(['loginform','login','loginout']);//用户认证
        // $this->middleware('adminauth');//死循环
    }


    /*
       // 多字段登录并判断状态
        public function attemptLogin(Request $request)
        {
            $username = $request->input('name');
            $password = $request->input('password');

            // 验证用户名登录方式
            $usernameLogin = $this->guard()->attempt(
                ['name' => $username, 'password' => $password,'status'=>1], $request->has('remember')
            );
            if ($usernameLogin) {
                return true;
            }

            // 验证手机号登录方式
            $mobileLogin = $this->guard()->attempt(
                ['mobile' => $username, 'password' => $password,'status'=>1], $request->has('remember')
            );
            if ($mobileLogin) {
                return true;
            }

            // 验证邮箱登录方式
            $emailLogin = $this->guard()->attempt(
                ['email' => $username, 'password' => $password,'status'=>1], $request->has('remember')
            );
            if ($emailLogin) {
                return true;
            }

            return false;
        }
    */


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function loginform()
    {

        // return 'hello login';
        return view('admin.loginform');
    }

    public function commonfunctiondemo()
    {
        showMsg(1, 'Hello 公共方法!');//公共方法；app/helper/functions
    }

    public function loginout()
    {
        Auth::guard('admin')->logout(); // 退出
        // request()->session()->invalidate();
        return redirect('/admin/login');
    }

    public function index()
    {
        // 获取当前认证用户...
        $user = Auth::guard('admin')->user();

        // 获取当前认证用户的ID...
        $id = Auth::guard('admin')->id();

        $data = ['id' => $id, 'user' => $user];

        return view('admin.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {

        $username = $request->input('username');
        $password = $request->input('password');

        //  echo $username . ';' . $password;


        $user = $this->validate($request, [
            'username' => 'required|max:20',
            'password' => 'required|min:5',
        ]);

        // $status = Auth::guard('admin')->attempt(['username' => $username, 'password' => $password]);
        $status = Auth::guard('admin')->attempt($user);

        // var_dump($status);

        if ($status) {

            session()->flash('flash_dangermsg', '奇怪，您的用户名和密码怎么就正确了呢');

            return redirect('/admin/index');
        }

        return redirect('/admin/login')->with('error', '用户名或密码错误');
    }


    public function create()
    {
        // return 'hello login';
        $str = 'laravel 可以直接在控制器中直接写验证逻辑;不过我建议单独创建验证类；以控制器名为目录；以方法名为文件名； ';
        return view('admin.create');
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    // public function store(Request $request)
    public function store(Login $request)
    {

        echo '表单请求验证';
        var_dump($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
