<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        //
        $middleware->validateCsrfTokens(except: [
            'api/*',
            'api/questions',
            'api/questions/*',
            'api/deletequestions/*',

            'api/exams',
            'api/exams/*',
            'api/deleteexams/*',

            'api/examdetails',
            'api/examdetails/*',
            'api/deleteexamdetails/*',

            'api/histories',
            'api/histories/*',
            'api/deletehistories/*',

            'api/historydetails',
            'api/historydetails/*',
            'api/deletehistorydetails/*',

            'api/roles',
            'api/roles/*',

            'api/categories',
            'api/categories/*',
            'api/deletecategories/*',
            
            'api/auth/login',
            'api/users',
            'api/users/*',
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
