<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable = ['dating_id','dating_amount','payment_status'];

    public function dating(){
        $this->belongsTo('App\Dating');
    }
}
