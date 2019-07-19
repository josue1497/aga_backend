<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BalanceConsultant extends Model
{
    //
    protected $fillable = ['consultant_id','amount'];

    public function consultant(){
            return $this->belongsTo('App\Consultant');
    }
}
