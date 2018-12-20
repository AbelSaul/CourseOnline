<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['middleware' => ['guest'] ], function(){
	Route::get('login','Auth\LoginController@showLoginForm')->name('login');
	Route::post('login','Auth\LoginController@login')->name('login');

	Route::get('register','Auth\RegisterController@showRegistrationForm')->name('register');
	Route::post('register','Auth\RegisterController@register')->name('register');

});

Route::group(['middleware' => ['auth'] ], function(){
	Route::post('logout','Auth\LoginController@logout')->name('logout');
	Route::group(['middleware' => ['Subscribed'] ], function(){
			Route::resource('/contents-course', 'ContentsCourseController');
			Route::resource('/user-courses', 'UsersCourseController');
			Route::get('/home', 'HomeController@index')->name('home');
			Route::resource('/task', 'TaskController');
			Route::resource('/course', 'CourseController');
	});

	Route::group(['middleware' => ['Invited'] ], function(){
		Route::get('/home', 'HomeController@index')->name('home');
		Route::resource('/task', 'TaskController');
		Route::resource('/course', 'CourseController');
	});
;
});





