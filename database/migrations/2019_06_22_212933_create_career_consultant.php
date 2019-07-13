<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCareerConsultant extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('career_consultant', function (Blueprint $table) {
            $table->unsignedInteger('career_id');
            $table->foreign('career_id')->references('id')->on('careers');

            $table->unsignedInteger('consultant_id');
            $table->foreign('consultant_id')->references('id')->on('consultants');
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
        Schema::dropIfExists('career_consultant');
    }
}
