<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Attached extends Model
{
    protected $table = 'attached';
    protected $fillable = ['name','url','dating_id'];

    public function dating(){
        return $this->belongsTo('App\Dating');
    }
}
