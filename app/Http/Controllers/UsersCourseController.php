<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use App\UsersCourse;
use App\Course;
use Illuminate\Http\Request;
use DB;

class UsersCourseController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('Subscribed');
    }
    
    public function index()
    {
        $user_courses = UsersCourse::join('courses','courses.id','=','users_courses.course_id')
                        ->select('courses.id','courses.name','courses.author','courses.duration','courses.url_img')
                        ->where(['user_id' => Auth::user()->id])->get();
        return response()->json([
            'user_courses'    => $user_courses
        ], 200);
    }

    public function store(Request $request)
    {
        $course_id = request('course_id');
        if (!$this->compareCourse($course_id)) {
                $user_course= UsersCourse::create([
                'user_id'     => Auth::user()->id,
                'course_id' => $course_id
            ]);
            return response()->json([
                'user_course'    => $user_course,
                'message' => 'Success'
            ], 200);
        }else{
            // $result = ['result' => 'The course already exists'];
            return '';
        }
    }

    public function compareCourse($course_id){
        $user_courses = $this->allCoursesUser();

        foreach ($user_courses as $key => $user_course) {
            if ($user_course->course_id == $course_id) {
                return true;
            }
        }
    }
    public function allCourses(){
        $courses = Course::all();
        return $courses;
    }

    public function allCoursesUser(){
        $user_courses = UsersCourse::where(['user_id' => Auth::user()->id])->get();
        return $user_courses;
    }

    public function allCoursesUserId($user_id){
        $user_courses = UsersCourse::where(['user_id' => $user_id])->get();
        return $user_courses;
    }

    public function verifyCourseUser($user_id,$course_id){
        $user_courses = $this->allCoursesUserId($user_id);
        
        foreach ($user_courses as $key => $user_course) {
            if ($user_course->course_id == $course_id) {
                return true;
            }
        }

    }

    public function allCoursesUserEmail($email){
       $user_courses =  UsersCourse::join('courses','courses.id','=','users_courses.course_id')
                        ->join('users','users.id','=','users_courses.user_id')
                        ->select('courses.name')
                        ->where('users.email','=',$email)
                        ->get();

        return $user_courses;
    }

    public function verifyUserCourseEmailCourseName($email,$nombre_curso){
        
        $user_courses = $this->allCoursesUserEmail($email);
        $result = '';
        foreach ($user_courses as $key => $user_course) {
            if ($user_course->name == $nombre_curso) {
                $result = 'El usuario ya se encuentra matriculado en ese curso';  
                return $result;
            }
        }

        return $result='';
    }

}
