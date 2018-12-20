<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddStateToUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // php artisan make:migration add_state_to_users
        //
        Schema::table('users',function(Blueprint $table){
            $table->string('state',1)->default('0');
            //Laravel resistra por lotes php artisan migrate:rollback
            // $table->string('state',1)->default('0');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users',function(Blueprint $table){
            $table->dropColum('state');
        });
    }
}
