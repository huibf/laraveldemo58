<?php

namespace App\Http\Controllers\Admin;

use App\Model\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use DB;
use App\Model\Article;

class DatabaseController extends Controller
{
    /**
     * 插入数据
     */
    public function insert()
    {
        DB::table('article')->insert([
            [
                'category_id' => 2,
                'title' => '文章2',
                'content' => '内容2'
            ],
            [
                'category_id' => 3,
                'title' => '文章3',
                'content' => '内容3'
            ],
        ]);
    }

    /**
     * 查询数据
     */
    public function get()
    {
        echo 'laradock;laravel安装';
        $data = DB::table('article')->get();
        dump($data);
    }

    /**
     * 查询数据
     */
    public function get_w()
    {
        $data = DB::table('article')
            ->where('id', 1)
            ->get();
        dump($data);
    }

    public function demo_collection()
    {
        $array = [
            '', '帅', '白', 0, '俊', false, '遥', null, '博', '客'
        ];
        $collect = collect($array);//数组转collection
        p($collect[0]);//公共方法;打印
        foreach ($collect as $K => $v) {
            p($v);
        }


    }

    public function demo_collect()
    {
        $array = [
            '', '帅', '白', 0, '俊', false, '遥', null, '博', '客'
        ];
        $collect = collect($array);//数组转collection
        // forget() 删除 '帅字'
// filter() 过滤为假的值
// implode() 用 - 连接
        dump($collect->forget(1)->filter()->implode('-'));// collection 的强大
    }

    public function demo_array()
    {
        $array = [
            '', '帅', '白', 0, '俊', false, '遥', null, '博', '客'
        ];
        // unset() 删除 '帅' 字
// array_filter() 过滤为假的值
// implode() 用 - 连接
        unset($array[1]);
        dump(implode('-', array_filter($array)));
    }

    /**
     * 模型；查询数据
     */
    public function get_m()
    {
        /*
        $data = Article::select('category_id', 'title', 'content')
             ->where('title', '<>', '文章1')
             ->whereIn('id', [1, 2, 3])
             ->groupBy('category_id')
             ->orderBy('id', 'desc')
             ->get();
        */

        $data = Article::where('id', 1)->get();
        dump($data);
        dump($data->toArray());
        dump($data->toJSON());
        p($data);
    }


    public function get_lst(){
        $adminmodel = new Admin();
        $adm = $adminmodel->adminlist();//模型对象调用
        p($adm);
    }
}
