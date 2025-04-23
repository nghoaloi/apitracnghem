<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory,HasApiTokens ;

    protected $table = 'user';
    protected $fillable = [
        'Id',
        'RoleId', // Thêm cột RoleId
        'FullName', // Thêm cột FullName
        'UserName', // Thêm cột UserName
        'Password',
        'CreateAt',
    ];

    public $timestamps = false;
    protected $primaryKey = 'Id';

}
