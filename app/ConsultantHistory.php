<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ConsultantHistory extends Model
{
    protected $table = 'consultant_history';
    protected $fillable = ['consultant_id', 'movement_type', 'description'];

    public function consultant()
    {
        return $this->belongsTo('App\Consultant');
    }
    public static function add_to_history($title, $summary, $consultant_id)
    {
        $history = new ConsultantHistory();
        $history->consultant_id = $consultant_id;
        $history->movement_type = $title;
        $history->description = $summary;
        $history->save();
    }
}
