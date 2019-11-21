<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;


// class Admin extends Model
class Admin extends Authenticatable
{
    //  use SoftDeletes; //开启软删除功能

    protected $table = 'admins'; //类Admin关联的表

    // protected $fillable = ['title', 'username', 'content'];//允许赋值的字段
    // protected $guarded = [];//不允许赋值的字段
    /*
    需要注意的是不能自相矛盾；
    $fillable 和 $guarded 只能定义其中的一个
        */


    //自定义方法
    public function demo()
    {

        return '看名字就知道是个靓仔';
    }

    //自定义方法
    public function demoa()
    {
        $str = $this->username . '"就知道是个美女';
        return '看名字"' . $str;
    }

    public function adminlist()
    {
        $data = $this->get();
        return $data;
    }


}
