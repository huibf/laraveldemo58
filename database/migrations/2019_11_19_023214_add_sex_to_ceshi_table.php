<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddSexToCeshiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ceshi', function (Blueprint $table) {

            $table->enum('sex',[0,1,2])->default(0)->comment('性别，默认保密');
            $table->timestamp('published_at');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ceshi', function (Blueprint $table) {

            if (Schema::hasColumn('sex', 'published_at')) {
                $table->dropColumn(['sex','added_on']);
            }
        });
    }
}
