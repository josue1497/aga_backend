<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    // protected $fillable = [
    //     'name', 'email', 'password',
    // ];

    protected $fillable = ['identification_document',
                            'name',
                            'lastname',
                            'birthdate',
                            'phone_number',
                            'email', 'password',
                            'attach_document'];


    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function Roles(){
        return $this->belongsToMany('App\Role','user_role')->withTimestamps();
    }

    public function BalanceUser(){
        return $this->hasOne('App\BalanceUser');
    }

    public function deposits(){
        return $this->hasMany('App\Deposit')->orderBy('created_at', 'DESC');
    }

    public function histories(){
        return $this->hasMany('App\HistoryUser')->orderBy('created_at', 'DESC');
    }

    public function datings(){
        return $this->hasMany('App\Dating');
    }

}
