<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $table = 'user';
    protected $fillable = [
        'Id',
        'role_id', // Thêm cột RoleId
        'full_name', // Thêm cột FullName
        'username', // Thêm cột UserName
        'name',
        'email',
        'password',
    ];

    public $timestamps = false;
    protected $primaryKey = 'Id';

}
