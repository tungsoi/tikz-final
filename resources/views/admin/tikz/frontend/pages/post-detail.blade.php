@extends('admin.tikz.frontend.layouts.master')
@section('style')
<link rel="stylesheet" href="{{ asset('tikz/css/hightlight-dar.css') }}" />
<style>
.mg-t-0 {
    margin-top: 0px !important;
    margin-bottom: 15px !important;
}
</style>
@endsection
@section('content')

@if(isset($post))
<div class="mainLeft">
    <div class="detail_topic_Pg">
        <div class="blog mg-t-0"><h3 style="color: #cf2b71" class="uppercase mg-t-0">- {{ $post->category() }}</h3> <br>
            <div class="titleBLog">
                <label class="detail-title">
                    {{ $post->title }}
                    <br>
                </label>
                <div class="article no-border">
                    <div class="otherArticle float-left">
                        {{ date('d/m/Y', strtotime($post->created_at)) }}
                        - {{ $post->userCreated->name }}
                        - {{ rand(10, 500) }} lượt xem
                    </div>
                </div>
                <br> <br>
            </div>
        </div>
        <div class="recent">

            <div class="tab-content">
                <div id="desctiption" class="tab-pane in active"> <br>
                    {!! $post->description !!}
                </div>
                <div id="code" class="tab-pane fade"> <br>
                    <button class="btn btn-xs btn-success" id="btn" data-clipboard-snippet data-clipboard-target="#bar">
                        Sao chép
                    </button>
                    <div id="bar">
                        <pre><code class="go">@if (!is_null($post->code)){!! $post->code !!}
                            @else"Đang cập nhật"@endif</code></pre>
                    </div>
                    <br>
                </div>
            </div>
            <div class="authorArticle float-right"><i>Tác giả: <strong>{{ $post->userCreated->name }}</strong></i></div> <br> <hr>
            <div class="authorArticle float-left">
                <i>Thẻ đính kèm:
                    @if (!is_null($post->tags))
                        @foreach($post->tags as $tag)
                            <a class="label label-primary taga-default" href="#" target="_blank">{{ \App\Models\Tag::find($tag)->name ?? null }}</a>
                        @endforeach
                    @endif
                </i>
            </div> <br> <br>
            <div class="authorArticle float-left">
                <i>Danh mục hình vẽ:
                    @if (!is_null($post->categories))
                        @foreach($post->categories as $cate)
                            <a class="label label-primary taga-default" href="#" target="_blank">{{ \App\Models\Category::find($cate)->name ?? null }}</a>
                        @endforeach
                    @endif
                </i>
            </div> <br>
        </div>
    </div>
</div>
@endif
@endsection

@section('script')
<script>
    $(document).ready(function() {
        $('.more-post img').click(function () {
            let url = $(this).attr('src');
            $('.post-banner-detail img').attr('src', url);
            $('.zoomWindowContainer div').css('background-image', 'url('+url+')');
        });

        var clipboard = new ClipboardJS('#btn');
        clipboard.on('success', function(e) {
            e.clearSelection();
        });

        // $(".post-banner-detail img").elevateZoom({easing : true, scrollZoom : true, zoomWindowWidth:500, zoomWindowHeight:400});
        // setTimeout(function () {
        //     $('.zoomContainer').eq(0).remove();
        //     $('.zoomContainer').eq(1).remove();
        // }, 1000);
    });
</script>
@endsection


