<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = ['name', 'value'];

    public function Users(){
        return $this->belongsToMany('App\User')->withTimestamps();
    }
}
