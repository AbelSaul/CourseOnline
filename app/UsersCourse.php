<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UsersCourse extends Model
{
    //
    protected $fillable = [
        'user_id', 'course_id', 
    ];

}
