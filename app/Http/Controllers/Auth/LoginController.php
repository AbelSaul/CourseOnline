<?php

namespace App\Http\Controllers\Auth;
use App\Http\Controllers\Controller;
use App\Services\ServiceSuscription;
use App\User;
use Auth;
use DateTime;

class LoginController extends Controller
{

    public function __construct(){
        $this->middleware('guest',['only' => 'showLoginForm']);
        //Solo pasaran a esta ruta los invitados los no autentificados
    }

    public function showLoginForm(){
        return view('auth.login');
    }

    public function login()
    {
        $credentials = request();

        $email = $credentials['email'];
        $serviceSuscriptions = new ServiceSuscription($email);

        $credentials = $this->validate(request(),[
                        $this->email() => 'required|string',
                        'password' => 'required|string'
                    ]);
        if ($this->consultUserCoursesOnline($email)) {
            if ($serviceSuscriptions->verifyUser()) 
            {
                if ($serviceSuscriptions->validateDateSuscription()) { 
           
                    if(Auth::attempt($credentials)){
                        $user = Auth::user();
                        if ($user->state == '0') {
                            $user->state = '1';
                            $user->save();
                        }
                        return redirect()->route('home');
                    }else{
                        return redirect('/login')->with('denied', 'Incorrect credentials !!');
                    }
                }else{
                    if(Auth::attempt($credentials)){
                        return redirect()->route('home');
                    }else{
                        return redirect('/login')->with('denied', 'Incorrect credentials !');
                    }
                }
            }else{
                if(Auth::attempt($credentials)){
                    return redirect()->route('home');
                }else{
                    return redirect('/login')->with('denied', 'Incorrect credentials');
                }
                // return redirect('/login')->with('denied', 'User not registered in online courses');
            }
        }else{

            return redirect('/login')->with('denied', 'Unregistered user');
        }


    }


    public function logout(){
        Auth::logout();
        return redirect('/');
    }

    public function email(){
        return 'email';
    }

    public function consultUserCoursesOnline($email){
        $users = User::where('email','=',$email)->count();
        // print_r($users);
        // exit;
        if ($users > 0) {
            return true;
        }
        return false;
    }



}
