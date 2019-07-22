<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HistoryUser extends Model
{
    protected $table = 'history_user';
    protected $fillable = ['user_id','movement_type','description'];

    public function user(){
        return $this->belongsTo('App\User');
    }

    public static function add_to_history($title,$summary, $user_id){
        $history=new HistoryUser();
        $history->user_id=$user_id;
        $history->movement_type=$title;
        $history->description=$summary;
        $history->save();
    }

}
