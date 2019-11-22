<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests\Admin\Login;
use App\Model\Admin;

class LoginController extends Controller
{
    /*
    https://xueyuanjun.com/books/laravel-packages  // Laravel 优质扩展包系列
M(Model)-V(View)-C(Controller)模式去组织代码，很多时候也未必指导性很强，
给Model加一个Repository，给Controller加一个Service，给View加一个Presenter，
或许代码结构更清晰。
    */

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


    protected function guard()
    {
        return Auth::guard('admin');
    }

    public function demomodel()
    {

        $adminmodel = new Admin();

        $adm = $adminmodel->demo();//模型对象调用

        var_dump($adm);

    }


    public function demomodel_a()
    {
        $adm = null;
        $admin = Admin::find(2);

        debug($admin);// 调试扩展包 barryvdh/laravel-debugbar
        p($admin);// 公共方法；app/helper/functions； 打印

        if (!empty($admin)) {
            $adm = $admin->demoa();// 调用模型对象的方法
        }

        var_dump($adm);

    }

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

        //$api_token = $user->generateToken();//更新api_token;


        $assign = ['id' => $id, 'user' => $user];

        // $assign = compact('id', 'user' );

        return view('admin.index', $assign);
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


        // $status =  $this->attemLogin($request); //多个字段登录；待研究

        // $status = Auth::guard('admin')->attempt(['username' => $username, 'password' => $password]);
        $status = Auth::guard('admin')->attempt($user);//登录

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
        $data = session()->all();
        var_dump($data);
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
