<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Role;
use App\BalanceUser;
use App\HistoryUser;
use Illuminate\Support\Facades\DB;

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

            $balance=new BalanceUser();
            $balance->amount=0;
            $balance->user_id=$user->id;
            $balance->save();

            $history=new HistoryUser();
            $history->user_id=$user->id;
            $history->movement_type='Registro';
            $history->description="Registro de usuario";
            $history->save();

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
        $user = User::where('id',$id);
        $data = $request->all();

        if ($user->update($data)) {
            HistoryUser::add_to_history('Actualización de Perfil',"Modificacion de la informacion de perfil de usuario el ".@date("d/m/y"),$id);
            return response()->json(['Actualizacion Exitosa'],200);
        }

        return response()->json(['Error al actualizar usuario'],400);
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
        $pass=$request->password;
        $user = (new User())->where('email', '=', $request->email)
            ->where('password', '=', $pass)->first();

        if ($user) {

            HistoryUser::add_to_history('Inicio de sesión',"Inicio de Sesión el ".@date("d/m/y"),$user->id);
            return  response()->json($user,200);
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
                            ->first();
        if ($user) {
            HistoryUser::add_to_history('Inicio de sesión',"Inicio de Sesión el ".@date("d/m/y"),$user->id);
            return json_encode($user);
        } else {
            return '0';
        }
    }

    public function user_balance(Request $request){
        $user = User::where('id',$request->user_id)->first();
        $balance=$user->BalanceUser;

        return json_encode($balance);
    }

    public function limit_five_dating(Request $request){
        $datings=DB::select('select * from datings
        where user_id=?
        and dating_status in (\'Aprobada\',\'Solicitado\')
        order by for_date desc
        limit 5', [$request->user_id]);

        return json_encode($datings);
    }

    public function change_password(Request $request){
        $user = User::where('id',$request->user_id)->first();

        $user->password=$request->new_password;

        if($user->save()){
            return json_encode('ok');
        }else{
            return json_encode('fail');
        }
    }

    public function current_password(Request $request){
        $user = User::where('id',$request->user_id)->first();

        return json_encode($user->password);

    }
}
