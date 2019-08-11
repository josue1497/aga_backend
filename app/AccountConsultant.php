<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AccountConsultant extends Model
{
    protected $table = 'account_consultants';

    protected $fillable = ['consultant_id','account_number', 'bank', 'to_use'];

    public function consultant(){
        return $this->belongsTo('App\Consultant');
    }
}
