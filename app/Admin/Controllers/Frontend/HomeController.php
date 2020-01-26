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
        $menus = $this->menu->whereStatus(1)->orderBy('order', 'asc')->get();
        $tags = $this->tag->all();
        $configSites = $this->configSite->all();
        $pictures = Picture::paginate(8);

        return view('admin.tikz.frontend.pages.index', compact('menus', 'tags', 'configSites', 'pictures'));
    }

    public function editorialBoard()
    {
        $document = ConfigSite::orderBy('id', 'desc')->where('code', 'document_learn_draw')->first();
        return view('admin.tikz.frontend.pages.editorialBoard', compact('document'));
    }

    public function detailPicture($slug) {
        try {
            $picture = Picture::where('slug', $slug)->first();
            $menus = $this->menu->whereStatus(1)->orderBy('order', 'asc')->get();
            $tags = $this->tag->all();
            $configSites = $this->configSite->all();

            return view('admin.tikz.frontend.pages.detail', compact('picture', 'menus', 'tags', 'configSites'));
        } catch (\Exception $e) {
            dd($e->getMessage());
        }
    }

    public function document($code) {
        $menu = MenuHome::where('path', "/page/$code")->first();
        if (is_null($menu)) { return redirect('/'); }
        else {
            $menus = $this->menu->whereStatus(1)->orderBy('order', 'asc')->get();
            $tags = $this->tag->all();
            $configSites = $this->configSite->all();
            $page = ConfigSite::where('code', $code)->first();
            $title = $menu->name;
            return view('admin.tikz.frontend.pages.document', compact('menus', 'tags', 'configSites', 'page', 'title'));
        }
    }

    public function category() {
        $menus = $this->menu->whereStatus(1)->orderBy('order', 'asc')->get();
        $tags = $this->tag->all();
        $configSites = $this->configSite->all();
        $title = MenuHome::where('path', "/categories")->first()->name;
        $categories = Category::all();
        return view('admin.tikz.frontend.pages.category', compact('menus', 'tags', 'configSites', 'title', 'categories'));
    }

    public function tag($id) {
        $tagSearch = Tag::find($id);
        $pictures = Picture::where('tags', 'like', '%'.$id.'%')->paginate(8);
        $menus = $this->menu->whereStatus(1)->orderBy('order', 'asc')->get();
        $tags = $this->tag->all();
        $configSites = $this->configSite->all();

        return view('admin.tikz.frontend.pages.index', compact('menus', 'tags', 'configSites', 'pictures', 'tagSearch'));
    }


    public function cate($id) {
        $cateSearch = Category::find($id);
        $pictures = Picture::where('categories', 'like', '%'.$id.'%')->paginate(8);
        $menus = $this->menu->whereStatus(1)->orderBy('order', 'asc')->get();
        $tags = $this->tag->all();
        $configSites = $this->configSite->all();

        return view('admin.tikz.frontend.pages.index', compact('menus', 'tags', 'configSites', 'pictures', 'cateSearch'));
    }
}
