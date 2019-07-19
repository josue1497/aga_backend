<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ConsultantHistory extends Model
{
    protected $table = 'consultant_history';
    protected $fillable = ['consultant_id','movement_type','description'];

    public function consultant(){
        return $this->belongsTo('App\Consultant');
    }
}
