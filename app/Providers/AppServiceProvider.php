<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Category;
use App\Models\ConfigSite;
use App\Models\MenuHome;
use App\Models\Slide;
use App\Models\Tag;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if (Schema::hasTable('categories')) {
            $pictureCategories = Category::all();
        } else {
            $pictureCategories = null;
        }

        if (Schema::hasTable('tags')) {
            $pictureTags = Tag::all();
        } else {
            $pictureTags = null;
        }

        if (Schema::hasTable('config_sites')) {
            $configSites = ConfigSite::all();
        } else {
            $configSites = null;
        }

        if (Schema::hasTable('menu_homes')) {
            $menus = MenuHome::whereStatus(1)->orderBy('order', 'asc')->get();
        } else {
            $menus = null;
        }

        if (Schema::hasTable('slides')) {
            $slides = Slide::orderBy('order')->get();
        } else {
            $slides = null;
        }

        view()->share('pictureCategories', $pictureCategories);
        view()->share('pictureTags', $pictureTags);
        view()->share('configSites', $configSites);
        view()->share('menus', $menus);
        view()->share('slides', $slides);
    }
}
