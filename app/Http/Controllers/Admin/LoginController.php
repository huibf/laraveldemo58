<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;


class LoginController extends Controller
{

    public function __construct()
    {
       $this->middleware('adminauth')->except(['loginform','login','loginout']);
       // $this->middleware('adminauth');//死循环
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
   public function loginout(){
       Auth::guard('admin')->logout(); // 退出
       return view('admin.loginform');
   }
    public function index()
    {
        // 获取当前认证用户...
        $user = Auth::guard('admin')->user();

        // 获取当前认证用户的ID...
        $id = Auth::guard('admin')->id();

       $data = ['id'=>$id,'user'=>$user];

        return view('admin.index',$data);
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

        echo $username . ';' . $password;


        $user = $this->validate($request, [
            'username' => 'required|max:20',
            'password' => 'required|min:5',
        ]);

       // $status = Auth::guard('admin')->attempt(['username' => $username, 'password' => $password]);

        $status = Auth::guard('admin')->attempt($user);

        var_dump($status);

        if ($status) {

            session()->flash('danger', '很抱歉，您的用户名和密码不匹配');

            return redirect('/admin/index');
        }
        return redirect('/admin/login')->with('error','用户名或密码错误');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
