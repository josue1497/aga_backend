<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AccountConsultant extends Model
{
    protected $table = 'account_consultants';

    protected $fillable = ['account_number', 'bank', 'to_use', 'bank_to'];

    public function consultant(){
        return $this->belongsTo('App\Consultant');
    }
}
