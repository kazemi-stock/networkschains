<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserRefersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_refers', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->unsignedBigInteger('user_id')->unique();
            $table->foreign('user_id')->references('id')->on('users');

            $table->unsignedBigInteger('refer_id');
            $table->foreign('refer_id')->references('id')->on('users');

            $table->timestamps();
        });



        DB::unprepared('
            CREATE TRIGGER  insert_user_refers
              AFTER INSERT
              ON `user_refers`
              FOR EACH ROW
            BEGIN

                UPDATE users SET `refers` = refers + 1   WHERE id = NEW.refer_id ;

            END
        ');


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_refers');
    }
}
