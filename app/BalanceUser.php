<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BalanceUser extends Model
{
    protected $table = 'balance_users';
    protected $fillable = ['user_id','amount'];

    public function user(){
        return $this->belongsTo('App\User');
}
}
