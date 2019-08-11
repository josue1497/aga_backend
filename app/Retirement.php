<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Retirement extends Model
{
    protected $table = 'retirement';

    protected $fillable = ['consultant_id','amount','retirement_status','bank_to'];

    public function consultant(){
        return $this->belongsTo('App\Consultant');
    }
}
