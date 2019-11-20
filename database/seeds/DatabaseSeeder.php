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

       /* //数据工厂制造测试数据
        factory(App\Article::class, 50)->create()->each(function ($article) {
            $article->categories()->sync($article->category_id);//待研究
        });
    */



    }
}
