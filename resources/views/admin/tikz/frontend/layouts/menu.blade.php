<div id='cssmenu'>
    <div id="menu-button">
        <span>Menu</span><img src="{{ asset('tikz/img/images/menu.png')}}" alt="">
    </div>
    <ul class="div-nmenu">
        @if (isset($menus) && !is_null($menus))
            @foreach ($menus as $key => $menu)
                <li class="" data-route=""><a href="{{ $menu->path }}">{{ $menu->name }}</a> </li>
            @endforeach
        @endif
    </ul>
</div>

