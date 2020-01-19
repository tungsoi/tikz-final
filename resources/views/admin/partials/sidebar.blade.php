<aside class="main-sidebar">
    <section class="sidebar">
        @if(config('admin.enable_menu_search'))
            <form class="sidebar-form" style="overflow: initial;" onsubmit="return false;">
                <div class="input-group">
                    <input type="text" autocomplete="off" class="form-control autocomplete" placeholder="Search...">
                    <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                    <ul class="dropdown-menu" role="menu" style="min-width: 210px;max-height: 300px;overflow: auto;">
                        @foreach(Admin::menuLinks() as $link)
                            <li>
                                <a href="{{ admin_base_path($link['uri']) }}">
                                    <i class="fa {{ $link['icon'] }}"></i>{{ $link['title'] }}</a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </form>
        @endif
        <ul class="sidebar-menu">
            @each('admin::partials.menu', Admin::menuData(['1']), 'item')
        </ul>
    </section>
</aside>
