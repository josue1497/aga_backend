<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Dating extends Model
{
    protected $fillable = ['user_id','consultant_id','for_date','title','summary'];

    public function user(){
        return $this->belongsTo('App\User');
    }

    public function consultant(){
        return $this->belongsTo('App\Consultant');
    }

    public function deposit(){
        return $this->hasOne('App\Deposit');
    }

}
