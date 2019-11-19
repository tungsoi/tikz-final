<div id='cssmenu'>
    <ul>

        @if (isset($menus) && !is_null($menus))
            @foreach ($menus as $key => $menu)
                <li class="{{ $key == 0 ? 'active' : '' }}" data-route=""><a href="{{ $menu->path }}">{{ $menu->name }}</a> </li>
            @endforeach
        @endif
        {{-- <li class="active" data-route=""><a href="{{ route('home.index') }}">Hình vẽ</a> </li>
        <li class="" data-route="category"><a href="/static-page/the-le-gui-bai-6.html">Danh mục hình vẽ</a>
            <ul>
                @if (isset ($picture_categories))
                    @foreach ($picture_categories as $picture_category)
                        <li class="">
                            <a href="#">{{ $picture_category->name }}</a>
                        </li>
                    @endforeach
                @endif
            </ul>
        </li>
        <li class="" data-route="editorial_board"><a href="{{ route('home.editorialBoard') }}">Tài liệu học vẽ</a> </li>
        <li class=""><a href="{{ route('home.index') }}">Tin tức</a> </li>
        <li class=""><a href="/static-page/the-le-gui-bai-6.html">Giới thiệu</a>
            <ul>
                <li class="">
                    <a href="{{ route('home.editorialBoard')}}">Ban biên tập</a>
                </li>
                <li class="">
                    <a href="/static-page/toa-soan-1.html">Toà soạn</a>
                </li>
                <li class="">
                    <a href="/static-page/the-le-gui-bai-6.html">Thể lệ gửi bài</a>
                </li>
            </ul>
        </li>
        <li class=""><a href="/contact-us">Liên hệ</a> </li> --}}
    </ul>
</div>

