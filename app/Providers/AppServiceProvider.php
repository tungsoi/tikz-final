<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Category;
use App\Models\ConfigSite;
use App\Models\MenuHome;
use App\Models\Slide;
use App\Models\Tag;

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
        $pictureCategories = Category::all();
        $pictureTags = Tag::all();
        $configSites = ConfigSite::all();
        $menus = MenuHome::whereStatus(1)->orderBy('order', 'asc')->get();
        view()->share('pictureCategories', $pictureCategories);
        view()->share('pictureTags', $pictureTags);
        view()->share('configSites', $configSites);
        view()->share('menus', $menus);
        view()->share('slides', Slide::orderBy('order')->get());
    }
}
