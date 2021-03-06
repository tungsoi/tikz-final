<?php

use Illuminate\Routing\Router;
use Brazzer\Admin\Facades\Admin;

Admin::routes();

// Frontend
Route::group([
    'prefix'     => '',
    'namespace'  => 'App\Admin\Controllers\Frontend'
], function(Router $router){
    $router->get('/', 'HomeController@index');
    $router->get('/pics', 'HomeController@index')->name('home.index');
    $router->get('/pics/{slug}', 'HomeController@detailPicture')->name('pic.detail');
    $router->get('/page/{code}', 'HomeController@document')->name('home.document');
    $router->get('/categories', 'HomeController@category')->name('home.category');
    $router->get('/pics/tag/{slug}', 'HomeController@tag')->name('pic.tag');
    $router->get('/pics/cate/{slug}', 'HomeController@cate')->name('pic.cate');
    $router->get('/posts', 'PostController@index')->name('post.index');
    $router->get('/posts/{slug}', 'PostController@detail')->name('post.detail');

});

// Backend
Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => 'App\Admin\Controllers\Backend',
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');


    // $router->get('/auth/redirect/{provider}', 'SocialController@redirect')->name('facebook.login');

    $router->resources([
        'menu_homes'    =>  'MenuHomeController',
        'tags'          =>  'TagController',
        'config_sites'  =>  'ConfigSiteController',
        'categories'    =>  'CategoryController',
        'pictures'      =>  'PictureController',
        'posts'         =>  'PostController',
        'post_categories'   =>  'PostCategoryController',
        'slides'   =>  'SlideController'
    ]);
});

Route::group(['middleware' => ['web']], function () {
    Route::get(
        'admin/auth/login/redirect/{provider}',
        'App\Admin\Controllers\Backend\SocialController@redirect'
    )->name('facebook.login');

    Route::get(
        'callback/{provider}',
        'App\Admin\Controllers\Backend\SocialController@callback')
    ->name('facebook.callback');
});




