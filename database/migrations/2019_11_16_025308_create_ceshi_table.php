<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCeshiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // https://www.bbsmax.com/A/Ae5RB8lM5Q/

        Schema::create('ceshi', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->unique();
            $table->integer('age')->nullable();
            $table->string('openid',255)->default('')->comment('微信端返回的openid');
            $table->string('nickname',45)->default('')->comment('顾问昵称，一般取自微信昵称');
            $table->string('avatar')->default('')->nullable()->comment('用户头像');
           // $table->enum('sex',[0,1])->default(0)->comment('性别，默认女');
            $table->char('phone',13)->default('')->comment('手机号码');

            //Laravel 的"boolean"类型映射到数据库的所有系统上的small integer列
            $table->boolean('state')->default(false)->comment('true:已回复; false:待回复');

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
        Schema::dropIfExists('ceshi');
    }
}
