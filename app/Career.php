<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Career extends Model
{
       protected $fillable = ['name', 'value'];

       public function Consultants(){
           return $this->belongsToMany('App\Consultant')->withTimestamps();
       }

}
