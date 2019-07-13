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
}
