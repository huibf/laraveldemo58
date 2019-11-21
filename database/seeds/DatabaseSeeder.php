<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);

       /*
       //https://segmentfault.com/a/1190000005085328
       //数据工厂制造测试数据
        factory(App\Article::class, 50)->create()->each(function ($article) {
            $article->categories()->sync($article->category_id); //article表与Category表的关联关系，对应的模型中定义的
        });

        factory(\App\Category::class, 5)->create()->each(function($category){
            $category->posts()->save(factory(\App\Post::class)->make());//待研究
        });
   */

    }
}
