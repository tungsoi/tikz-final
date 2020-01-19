<div class="footer">
    <div class="bottom">
        @if (isset($configSites) && !is_null($configSites))
            @foreach ($configSites as $key => $configSite)
                @if ($configSite->code == 'copy-right')
                    {!! $configSite->content !!}
                @endif
            @endforeach
        @endif
    </div>
</div>
