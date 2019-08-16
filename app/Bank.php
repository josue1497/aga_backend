<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bank extends Model
{
    //
    protected $fillable = ['code','name','identification_document','account_type'];
}
