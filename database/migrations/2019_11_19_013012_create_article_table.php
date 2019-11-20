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

            /*
             // category_id
            $table->string('openid',255)->default('')->comment('微信端返回的openid');
            $table->string('nickname',45)->default('')->comment('顾问昵称，一般取自微信昵称');
            $table->string('avatar')->default('')->comment('用户头像');
            $table->enum('sex',[0,1])->default(0)->comment('性别，默认女');
            $table->char('phone',13)->default('')->comment('手机号码');
            */

            $table->string('title');
            $table->text('body');
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
