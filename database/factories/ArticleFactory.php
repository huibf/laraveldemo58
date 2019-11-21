<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model;
use Faker\Generator as Faker;

$factory->define(App\Model\Article::class, function (Faker $faker) {
    // $post_ids = \App\Model\Admin::lists('id')->toArray();
    $time = $faker->dateTimeThisMonth();//随机取一个月以内的时间.
    return [
        // 'post_id' => $faker->randomElement($post_ids),

        'title'       => $faker->name,
        'content'        => $faker->paragraph,
        'description' => $faker->sentence,
        'image_url'   => '/img/default.jpg',
        'author_id'   => function () {
            return factory(App\Model\Admin::class)->create()->id;
        },
        'author'      => function (array $article) {
            return App\Model\Admin::find($article['author_id'])->name;
        },
        'created_at'  => $time,
        // 'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
        'updated_at'  => $time,

    ];

});
