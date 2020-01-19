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
        <div class="titleFooter">
            <label class="detail-title">Thẻ đính kèm</label>
        </div>
        <div class="contentTag">
            <ul>
                @if (isset ($tags))
                    @foreach ($tags as $tag)
                        <li>
                            <span></span>
                            <a href="#" title="{{ $tag->name }}">{{ $tag->name }}</a> </li>
                        <li>
                    @endforeach
                @endif
            </ul>
        </div>
    </div>

    <hr>

    <div class="tags">
        <div class="titleFooter">
            <label class="detail-title">Thành viên</label>
        </div>
        @if (isset($configSites) && !is_null($configSites))
            @foreach ($configSites as $key => $configSite)
                @if ($configSite->code == 'so-luong-thanh-vien')
                    <div class="">{!! $configSite->content !!}</div>
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
            <div class="titleFooter">
                <label class="detail-title">Thông tin chính</label>
            </div>
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
                    <label class="detail-title">Theo Dõi fanpage</label>
                </div> <br>
                {{-- <div class="fb-page" data-href="https://www.facebook.com/H&#xf4;m-Nay-Con-G&#xec;-108420127348477/" data-tabs="timeline" data-width="" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/H&#xf4;m-Nay-Con-G&#xec;-108420127348477/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/H&#xf4;m-Nay-Con-G&#xec;-108420127348477/">Hôm Nay Con Gì</a></blockquote></div> --}}

                <a href="#" class="icon-social">
                    <img src="{{ asset('tikz/img/images/icon_fb.png') }}" title="Trang Facebook" target="_blank" alt="" />
                </a>
            </div>
        </div>
    </div>

    <hr>
</div>
