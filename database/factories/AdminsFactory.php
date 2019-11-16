<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model\Admin;
use Faker\Generator as Faker;

//模型工厂;用于生成测试数据


// https://blog.csdn.net/coder_chang/article/details/78690186    //laravel 使用测试工厂Factory添加测试数据
// https://blog.csdn.net/qq_40138803/article/details/95608481   //laravel中seed

$factory->define(App\Model\Admin::class, function (Faker $faker) {
    static $password;
    return [
         'username' => $faker->name,
         'password' => $password ?: $password = bcrypt('123456'), // password
        // 'email' => $faker->unique()->safeEmail,
        // 'mobile' => $faker->unique()->phoneNumber,
        // 'remember_token' => Str::random(10),
    ];
});
