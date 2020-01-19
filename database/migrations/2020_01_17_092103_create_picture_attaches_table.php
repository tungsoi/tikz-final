<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePictureAttachesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('picture_attaches', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('picture_id')->nullable();
            $table->integer('attach_id')->nullable();
            $table->integer('type')->default(0)->comment('0: tag, 1: category');
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
        Schema::dropIfExists('picture_attaches');
    }
}
