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

    public function BalanceConsultant(){
        return $this->hasOne('App\BalanceConsultant');
    }

    public function histories(){
       return $this->hasMany('App\ConsultantHistory');
    }

    public function datings(){
        return $this->hasMany('App\Dating');
    }

}
