<div id='cssmenu'>
    <div id="menu-button" class="">Menu</div>
    <ul>
        @if (isset($menus) && !is_null($menus))
            @foreach ($menus as $key => $menu)
                <li class="" data-route=""><a href="{{ $menu->path }}">{{ $menu->name }}</a> </li>
            @endforeach
        @endif
    </ul>
</div>

