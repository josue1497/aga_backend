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

}
