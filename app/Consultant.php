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
                                'price_per_hour','office_hours_from',
                                'office_hours_to'
                                ];

       public function Careers(){
           return $this->belongsToMany('App\Career')->withTimestamps();
       }

    public function BalanceConsultant(){
        return $this->hasOne('App\BalanceConsultant');
    }

    public function histories(){
       return $this->hasMany('App\ConsultantHistory')->orderBy('created_at', 'DESC');
    }

    public function datings(){
        return $this->hasMany('App\Dating')->orderBy('created_at', 'ASC');
    }

}
