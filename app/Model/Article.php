<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{

    protected $table = 'article';

    /**
     * 属性类型
     *
     * @var array
     */
    protected $casts = [
        'tag_id' => 'array',//标签id;多个
    ];

    // 表的关联关系，
    public function categories()
    {
        return $this->belongsTo(Category::class);
    }

/*
 * 属性类型转换
下面手动定义一个访问器和存储器实现属性类型的功能；
命名的规则就是get/set字段名Attribute；
*/
    /**
     * 存入数据库的时候；把数组转成 json
     * @param  string  $value
     * @return void
     */
    public function setTagIdAttribute($value)
    {
        $this->attributes['tag_id'] = json_encode($value);
    }

    /**
     * 获取数据时把json转成php数组
     *
     * @param  string  $value
     * @return string
     */
    public function getTagIdAttribute($value)
    {
        return json_decode($value, true);
    }

}
