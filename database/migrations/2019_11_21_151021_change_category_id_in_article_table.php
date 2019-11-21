<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ChangeCategoryIdInArticleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('article', function (Blueprint $table) {
           // $table->tinyInteger('category_id')->unsigned()->default(0)->comment('分类id')->change(); // dbal 并不支持修改成 tinyInteger
            $table->boolean('category_id')->unsigned()->default(0)->comment('分类id')->change();//  tinyint
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('article', function (Blueprint $table) {
            $table->integer('category_id')->unsigned()->default(0)->comment('分类id')->change();
        });
    }
}
