<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Deposit extends Model
{
    protected $fillable = ['user_id','amount', 'document', 'deposit_status'];

    public function user(){
        return $this->belongsTo('App\User');
    }
}
