<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model\Admin;
use App\User;
use Illuminate\Support\Str;
use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'email_verified_at' => now(),
        'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
        'remember_token' => Str::random(10),
    ];
});

//模型工厂;用于生成测试数据

// https://blog.csdn.net/coder_chang/article/details/78690186    //laravel 使用测试工厂Factory添加测试数据
// https://blog.csdn.net/qq_40138803/article/details/95608481   //laravel中seed

/*
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
*/