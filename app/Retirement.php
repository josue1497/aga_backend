<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Retirement extends Model
{
    protected $table = 'retirement';

    protected $fillable = ['amount','retirement_status'];

    public function consultant(){
        return $this->belongsTo('App\Consultant');
    }
}
