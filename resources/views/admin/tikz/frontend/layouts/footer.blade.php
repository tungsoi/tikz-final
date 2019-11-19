<div class="footer">
    <div class="bottom">
        <div class="linkBottom">Powered by

            <a href="https://www.funix.edu.vn/">
                <img src="{{ asset('tikz/img/images/fpt.png') }}" class="" id="" alt="No Image" /> </a> &
            <a href="http://grooo.vn/">
                <img src="{{ asset('tikz/img/images/grooo.png') }}" class="" id="" alt="No Image" /> </a>
        </div>
        @if (isset($configSites) && !is_null($configSites))
            @foreach ($configSites as $key => $configSite)
                @if ($configSite->code == 'copy-right')
                    {!! $configSite->content !!}
                @endif
            @endforeach
        @endif
    </div>
</div>
