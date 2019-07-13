<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Consultant extends Model
{
       protected $fillable = ['identification_document',
                                'name',
                                'lastname',
                                'birthdate',
                                'phone_number',
                                'email', 'password',
                                ];

       public function Careers(){
           return $this->belongsToMany('App\Career')->withTimestamps();
       }
}
