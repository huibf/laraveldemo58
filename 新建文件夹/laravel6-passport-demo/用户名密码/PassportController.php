<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Validator;

class PassportController extends Controller
{
    protected $clientId;
    protected $clientSecret;

    public function __construct()
    {
        $this->middleware('auth')->except('login', 'register', 'refresh');
        $client = \DB::table('oauth_clients')->where('id', 2)->first();
        /*
         $client = Cache::remember('password_client',60*2,function(){
             return  \DB::table('oauth_clients')->where('id',2)->first();
          });
        */
        $this->clientId = $client->id;
        $this->clientSecret = $client->secret;
    }

    protected function username()
    {
        return 'email';
    }

    /*
        public function logout(Request $request)
        {
            auth()->user()->token()->revoke();//只会使access_token 失效
            return ['message' => '退出成功'];
        }
    */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            //   'name' => ['required', 'string', 'unique:users',],
            'name' => ['required', 'string',],
            'email' => ['required', 'string', 'email',],
            'password' => ['required', 'string', 'confirmed',],
        ]);
    }

    public function logout()
    {
        $tokenModel = auth()->user()->token();
        $tokenModel->update(['revoked' => 1,]);
        \DB::table('oauth_refresh_tokens')
            ->where(['access_token_id' => $tokenModel->id])
            ->update(['revoked' => 1,]);

        return ['message'=>'退出成功'];
    }

    public function login()
    {
        $ifusername = $this->username();
        $val = request($ifusername);

        // $user   = User::where($ifusername, $val)->findOrFail();//有错误
        $user = User::where($ifusername, $val)->first();

        if (!password_verify(request('password'), $user->password)) {
            return response()->json(['error' => '账号或密码错误',], 403);
        }
        return $this->getToken();

    }

    public function refresh()
    {
        $clientid = $this->clientId;
        $refresh_token = request('refresh_token');
        $clientsecret = $this->clientSecret;

        // return $clientsecret.';'.$clientid.';'.$refresh_token;

        $response = (new Client())->post('http://passportdemo65.test/api/oauth/token', [
            'form_params' => [
                'grant_type' => 'refresh_token',
                'refresh_token' => $refresh_token,
                'client_id' => $clientid,
                'client_secret' => $clientsecret,
                'scope' => '*',
            ]
        ]);

        return $response;
    }

    public function register()
    {
        $data = request()->all();

        //   $ifvalidate =  $this->validator($data)->validate();
        //   $ifcreate =   $this->create($data);
        $iftoken = $this->getToken();

        return $iftoken;

    }

    protected function create(array $data)
    {
        return User::forceCreate([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => password_hash($data['password'], PASSWORD_DEFAULT)
        ]);
    }

    public function getToken()
    {
        $clientid = $this->clientId;
        $username = request('email');
        $password = request('password');
        $clientsecret = $this->clientSecret;

        // return $clientid.';'.$username.';'.$password.';'.$clientsecret.';';

        $response = (new Client())->post('http://passportdemo65.test/api/oauth/token', [
            'form_params' => [
                'grant_type' => 'password',
                'username' => $username,
                'password' => $password,
                'client_id' => $clientid,
                'client_secret' => $clientsecret,
                'scope' => '*',
            ]
        ]);

        return $response;

    }


}
