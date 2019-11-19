<?php

use Illuminate\Routing\Router;

Admin::routes();

// Frontend
Route::group([
    'prefix'     => '',
    'namespace'  => 'App\Admin\Controllers\Frontend'
], function(Router $router){
    $router->get('/', 'HomeController@index')->name('home.index');
    $router->get('/editorial_board', 'HomeController@editorialBoard')->name('home.editorialBoard');
});

// Backend
Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => 'App\Admin\Controllers\Backend',
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');

    $router->resources([
        'menu_homes'    =>  MenuHomeController::class,
        'tags'          =>  TagController::class,
        'config_sites'  =>  ConfigSiteController::class

    ]);
});
