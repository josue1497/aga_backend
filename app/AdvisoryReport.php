<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AdvisoryReport extends Model
{
    protected $table = 'advisory_report';
    protected $fillable = ['report_title','report_message','dating_id'];

    public function datings(){
        return $this->belongsTo('App\Dating');
    }

}
