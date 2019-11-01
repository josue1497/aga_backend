<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BugReport extends Model
{
    protected $table = 'bug_report';
    protected $fillable = ['report_title','report_message','consultant_id'];

    public function consultant(){
        return $this->belongsTo('App\Consultant');
    }
}
