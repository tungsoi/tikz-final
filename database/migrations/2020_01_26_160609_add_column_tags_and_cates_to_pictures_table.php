<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnTagsAndCatesToPicturesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('pictures', function (Blueprint $table) {
            if (! Schema::hasColumn('pictures', 'tags')) {
                $table->text('tags')->nullable();
            }

            if (! Schema::hasColumn('pictures', 'categories')) {
                $table->text('categories')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('pictures', function (Blueprint $table) {
            if (Schema::hasColumn('pictures', 'tags')) {
                $table->dropColumn('tags');
            }

            if (Schema::hasColumn('pictures', 'categories')) {
                $table->dropColumn('categories');
            }
        });
    }
}
