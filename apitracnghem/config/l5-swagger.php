<?php
return [
    'default' => 'default', // Đặt tên cấu hình mặc định

    'documentations' => [
        'default' => [
            'api' => [
                'title' => 'API Documentation',
            ],
            'routes' => [
                'api' => 'api/documentation',
            ],
            'paths' => [
                'annotations' => base_path('app/Http/Controllers'), // Ensure this points to the directory containing annotations
                'docs' => storage_path('api-docs'),
                'base' => null,
            ],
            'generate_always' => true, // Always regenerate docs
            'debug' => true, // Enable debugging
        ],
    ],
];
