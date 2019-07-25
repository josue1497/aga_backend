<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransactionUser extends Model
{
    protected $table = 'transactions_user';
    protected $fillable = ['user_id','transaction_type','movement_id'];

}
