<?php

namespace App\Admin\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Tag;
use App\Models\MenuHome;
use App\Models\ConfigSite;

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

        return view('admin.tikz.frontend.pages.index', compact('menus', 'tags', 'configSites'));
    }

    public function editorialBoard()
    {
        $document = ConfigSite::orderBy('id', 'desc')->where('code', 'document_learn_draw')->first();
        return view('admin.tikz.frontend.pages.editorialBoard', compact('document'));
    }
}
