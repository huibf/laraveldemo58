<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model;
use Faker\Generator as Faker;

$factory->define(App\Model\Article::class, function (Faker $faker) {

    $time = $faker->dateTimeThisMonth();//随机取一个月以内的时间.
    return [

        'title'       => $faker->name,
        'body'        => $faker->paragraph,
        'description' => $faker->sentence,
        'image_url'   => '/img/default.jpg',
        'author_id'   => function () {
            return factory(App\Model\Admin::class)->create()->id;
        },
        'author'      => function (array $article) {
            return App\Model\Admin::find($article['author_id'])->name;
        },
        'created_at'  => $time,
        'updated_at'  => $time,

    ];

});
