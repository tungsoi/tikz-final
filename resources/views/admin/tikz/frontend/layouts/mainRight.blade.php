<div class="mainRight">
    <div class="search">
        <form method="get" accept-charset="utf-8" action="/pages/search">
            <div class="searchContent">
                <div class="input text">
                    <input type="text" name="keyword" placeholder="Tìm kiếm hình vẽ" id="keyword" />
                </div>
                <button type="submit">
                    <img src="{{ asset('tikz/img/images/icon_search.png') }}" alt="" /> </button>
                <style>

                </style>
            </div>
        </form>
    </div>

    <div class="dat">
        <img src="{{ asset('tikz/img/images/pictureshare.jpg') }}" alt="" /> <a href="/book-magazine" class="" id="" title="Đặt Tạp Chí">Chia sẻ hình vẽ</a>
    </div>

    <div class="dat">
        <img src="{{ asset('tikz/img/images/bannerRight.png') }}" alt="" />
    </div>

    <hr>

    <div class="tags">
        <div class="titleTag">THẺ ĐÍNH KÈM</div>
        <div class="contentTag">
            <ul>
                @if (isset ($tags))
                    @foreach ($tags as $tag)
                        <li>
                            <span></span>
                            <a href="/tags/{{ $tag->id }}" title="{{ $tag->name }}">{{ $tag->name }}</a> </li>
                        <li>
                    @endforeach
                @endif
            </ul>
        </div>
    </div>

    <hr>

    <div class="tags">
        @if (isset($configSites) && !is_null($configSites))
            @foreach ($configSites as $key => $configSite)
                @if ($configSite->code == 'so-luong-thanh-vien')
                    <div class="titleTag">{!! $configSite->content !!}</div>
                @endif
            @endforeach
        @endif
    </div>

    <hr>

    <div class="footer">
        <div class="footerBlog">
            <div class="titleFooter">
                <img src="{{ asset('tikz/img/images/logo_banner.png') }}" class="logoFooter" alt="" /> </div>
            <div class="contentFooter">
                @if (isset($configSites) && !is_null($configSites))
                    @foreach ($configSites as $key => $configSite)
                        @if ($configSite->code == 'mo-ta')
                            {!! $configSite->content !!}
                        @endif
                    @endforeach
                @endif
            </div>
        </div>

        <div class="footerBlog">
            @if (isset($configSites) && !is_null($configSites))
                @foreach ($configSites as $key => $configSite)
                    @if ($configSite->code == 'thong-tin-chinh')
                        {!! $configSite->content !!}
                    @endif
                @endforeach
            @endif
        </div>

        <div class="footerBlog">
            <div class="follow">
                <div class="titleFooter">
                    <label>Theo Dõi</label>
                </div>
                <a href="#"><img src="{{ asset('tikz/img/images/icon_fb.png') }}" title="Trang Facebook" target="_blank" alt="" /></a>
            </div>
        </div>
    </div>

</div>
