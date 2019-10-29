<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ErrorReport extends Model
{
    protected $table = 'error_reports';
    protected $fillable = ['error_title','error_description','dating_id'];

    public function Dating(){
        return $this->belongsTo('App\Dating');
    }

}
