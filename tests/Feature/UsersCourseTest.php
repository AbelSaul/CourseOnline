<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Http\Controllers\UsersCourseController;

class UsersCourseTest extends TestCase 
{
    /**
     * A basic test example.
     *
     * @return void
     */
    // el nombre tiene que empezar con test..
    public function testVerifyCourseUser()
    {
    	$users_course = new UsersCourseController();
    	$result = $users_course->verifyCourseUser(1,2);
        $this->assertTrue($result);
    }

    public function testVerifyUserCourseEmailCourseName()
    {
        $users_course = new UsersCourseController();
        $result = $users_course->verifyUserCourseEmailCourseName('abelmiraval@gmail.com','Expert PHP');
        $this->assertSame($result,'El usuario ya se encuentra matriculado en ese curso');
    }
}
