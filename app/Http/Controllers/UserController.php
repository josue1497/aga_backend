<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Role;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user = new User();
        $u1=(new User())->where('email', '=', $request->email)->first();
        $exist1 = (new User())->where('identification_document', '=', $request->identification_document)->first();

        if($exist1){
            return json_encode('Ya existe Identificación esta registrada.');
        }

        if($u1){
            return json_encode('Esta direccion de correo electrónico ya esta en Uso.');
        }


        $data = $request->only($user->getFillable());

        $career_rel=$request->role_id;
        $to_career=Role::where('value', $career_rel)->get();

        if ($user->fill($data)->save()) {
            $user->Roles()->attach($to_career);
            return json_encode('success');
        } else {
            return json_encode('fail');
        }
        return $user;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function singin(Request $request){
        $mail=$request->email;
        $pass=$request->password;
        $consultant = (new User())->where('email', '=', $request->email)
            ->where('password', '=', $pass)->first();

        if ($consultant) {
            return json_encode($consultant);
        } else {
            return '0';
        }
    }

    public function admin_singin(Request $request){
        $mail=$request->email;
        $pass=$request->password;
        $role=$request->role;

            $user = User::join('user_role', 'users.id',   '=', 'user_role.user_id')
                            ->join('roles', 'roles.id','=','user_role.role_id')
                            ->select('users.*')->where('email', '=', $mail)
                            ->where('password', '=', $pass)
                            ->where('roles.value', '=', $role)
                            ->get();
        if ($user) {
            return json_encode($user);
        } else {
            return '0';
        }
    }
}
