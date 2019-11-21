<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;


class Admin extends Model
    //class Admin extends Authenticatable
{
    protected $table = 'admins';

    //自定义方法
   public  function demo(){

       return '看名字就知道是个靓仔' ;
   }
    //自定义方法
    public  function demoa(){
        $str = $this->username.'"就知道是个美女';
        return '看名字"'.$str;
    }
}
