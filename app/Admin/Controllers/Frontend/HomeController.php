<?php

namespace App\Admin\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Tag;
use App\Models\MenuHome;
use App\Models\ConfigSite;
use App\Models\Picture;
use App\Models\Category;

class HomeController extends Controller
{
    private $menu;
    private $tag;
    private $configSite;

    public function __construct()
    {
        $this->menu = new MenuHome();
        $this->tag = new Tag();
        $this->configSite = new ConfigSite();
    }

    public function index()
    {
        $pictures = Picture::paginate(8);
        return view('admin.tikz.frontend.pages.index', compact('pictures'));
    }

    public function detailPicture($slug) {
        try {
            $picture = Picture::where('slug', $slug)->first();
            return view('admin.tikz.frontend.pages.detail', compact('picture'));
        } catch (\Exception $e) {
            dd($e->getMessage());
        }
    }

    public function document($code) {
        $menu = MenuHome::where('path', "/page/$code")->first();
        if (is_null($menu)) { return redirect('/'); }
        else {
            $page = ConfigSite::where('code', $code)->first();
            $title = $menu->name;
            return view('admin.tikz.frontend.pages.document', compact('page', 'title'));
        }
    }

    public function category() {
        $title = MenuHome::where('path', "/categories")->first()->name;
        $categories = Category::all();
        return view('admin.tikz.frontend.pages.category', compact('title', 'categories'));
    }

    public function tag($slug) {
        $tagSearch = Tag::where('code', $slug)->first();
        $pictures = Picture::where('tags', 'like', '%'.$tagSearch->id.'%')->paginate(8);

        return view('admin.tikz.frontend.pages.index', compact('pictures', 'tagSearch'));
    }


    public function cate($slug) {
        $cateSearch = Category::where('code', $slug)->first();
        $pictures = Picture::where('categories', 'like', '%'.$cateSearch->id.'%')->paginate(8);

        return view('admin.tikz.frontend.pages.index', compact('pictures', 'cateSearch'));
    }
}
