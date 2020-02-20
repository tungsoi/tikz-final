<style>
    .slideNews img {
        width : 617px;
        height : 300px;
    }
</style>
@if (isset($slides))
<div class="slideNews">
    <ul class="bxslider">
            @foreach ($slides as $slide)
            <li>
                <div class="article">
                    <div class="hw-image"><img

                        @if ($slide->picture->avatar != "images/")
                        src="{{ asset($slide->picture->avatar) }}"
                        @else
                        src="{{ asset('img/default-image.gif') }}"
                        @endif

                        alt="{{ $slide->picture->title }}"/></div>
                    <div class="titleArticle">
                        <a href="{{ route('pic.detail', $slide->picture->slug) }}" title="HÌNH HỌC ĐA CHIỀU VÀ NGUYÊN LÝ XÂY DỰNG KHOA HỌC" class="uppercase">{{ $slide->picture->title }}</a> </div>
                    <div class="contentArticle">{{ $slide->picture->sub_title }}</div>
                    <div class="otherArticle">
                        <span>{{ date('d/m/Y', strtotime($slide->picture->created_at)) }} - {{ $slide->picture->userCreated->name }}</span>
                    </div>
                </div>
            </li>
            @endforeach
    </ul>
</div>
@endif
