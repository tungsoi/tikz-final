<?php

use Illuminate\Routing\Router;
use Brazzer\Admin\Facades\Admin;

Admin::routes();

// Frontend
Route::group([
    'prefix'     => '',
    'namespace'  => 'App\Admin\Controllers\Frontend'
], function(Router $router){
    $router->get('/', function (){
        return redirect('pics');
    });
    $router->get('/pics', 'HomeController@index')->name('home.index');
    $router->get('/pics/{slug}', 'HomeController@detailPicture')->name('pic.detail');
    $router->get('/page/{code}', 'HomeController@document')->name('home.document');
    $router->get('/categories', 'HomeController@category')->name('home.category');
    $router->get('/pics/tag/{id}', 'HomeController@tag')->name('pic.tag');
    $router->get('/pics/cate/{id}', 'HomeController@cate')->name('pic.cate');

});

// Backend
Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => 'App\Admin\Controllers\Backend',
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');

    $router->resources([
        'menu_homes'    =>  'MenuHomeController',
        'tags'          =>  'TagController',
        'config_sites'  =>  'ConfigSiteController',
        'categories'    =>  'CategoryController',
        'pictures'      =>  'PictureController'
    ]);
});
