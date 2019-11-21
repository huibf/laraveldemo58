<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArticleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('article', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->integer('category_id')->unsigned()->default(0)->comment('分类id');
            $table->string('title')->comment('标题');
            $table->text('content')->comment('内容');
            $table->string('tag_id')->default('')->comment('标签id');//多个

            $table->string('description',100);
            $table->integer('author_id');
            $table->string('image_url')->default('')->comment('标题图片');
            $table->string('author',45)->default('')->comment('昵称');
            $table->char('realname',20)->default('')->comment('真实姓名');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {


        Schema::dropIfExists('article');
    }
}
