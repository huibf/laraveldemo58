<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

//表单验证类
class Login extends FormRequest
{

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {   //主要用于验证权限

        return true;
       // return false;
       // return Auth::id() === 1 ? true : false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'username' => 'required|string|max:255',
           // 'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ];
    }
}
