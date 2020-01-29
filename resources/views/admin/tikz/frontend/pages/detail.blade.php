@extends('admin.tikz.frontend.layouts.master')
@section('style')
<link rel="stylesheet" href="{{ asset('tikz/css/hightlight-dar.css') }}" />
@endsection
@section('content')

@if(isset($picture))
<div class="mainLeft">
    <div class="detail_topic_Pg">
        <div class="slideNews">
            <ul class="bxslider pd0">
                <li>
                    <div class="hw-image picture-banner-detail">
                        <img
                            @if ($picture->avatar != "images/")
                            src="{{ asset($picture->avatar) }}"
                            @else
                            src="{{ asset('img/default-image.gif') }}"
                            @endif

                            alt="{{ $picture->title }}"

                            @if ($picture->avatar != "images/")
                            data-zoom-image="{{ asset($picture->avatar) }}"
                            @else
                            data-zoom-image="{{ asset('img/default-image.gif') }}"
                            @endif/>
                    </div>
                </li>
            </ul>
            <hr>
        </div>

        <div class="slideNews more-picture">
            <img
                @if ($picture->avatar != "images/")
                src="{{ asset($picture->avatar) }}"
                @else
                src="{{ asset('img/default-image.gif') }}"
                @endif

                alt="{{ $picture->title }}"
            />
            @if (!is_null($picture->images))
                @foreach ($picture->images as $image)
                    <img src="{{ asset($image) }}" alt="{{ $picture->title }}" />
                @endforeach
            @endif
        </div>

        <hr>
        <div class="blog">
            <div class="titleBLog">
                <label class="detail-title">
                    {{ $picture->title }}
                </label>
                <div class="article no-border">
                    <div class="otherArticle float-left">
                        {{ date('d/m/Y', strtotime($picture->created_at)) }}
                        - {{ $picture->userCreated->name }}
                        - {{ rand(10, 500) }} lượt xem
                    </div>
                </div>
                <br>
            </div>
        </div>
        <div class="recent">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#desctiption">Mô tả</a></li>
                <li><a data-toggle="tab" href="#code">Mã Code Tikz</a></li>
            </ul>

            <div class="tab-content">
                <div id="desctiption" class="tab-pane fade in active"> <br>
                    {!! $picture->description !!}
                </div>
                <div id="code" class="tab-pane fade"> <br>
                    <button class="btn btn-xs btn-success" id="btn" data-clipboard-snippet data-clipboard-target="#bar">
                        Sao chép
                    </button>
                    <div id="bar">
                        <pre><code class="go">@if (!is_null($picture->code)){!! $picture->code !!}
                            @else"Đang cập nhật"@endif</code></pre>
                    </div>
                    <br>
                </div>
            </div>
            <div class="authorArticle float-right"><i>Tác giả: <strong>{{ $picture->userCreated->name }}</strong></i></div> <br> <hr>
            <div class="authorArticle float-left">
                <i>Thẻ đính kèm:
                    @if (!is_null($picture->tags))
                        @foreach($picture->tags as $tag)
                            <a class="label label-primary taga-default" href="#" target="_blank">{{ \App\Models\Tag::find($tag)->name ?? null }}</a>
                        @endforeach
                    @endif
                </i>
            </div> <br> <br>
            <div class="authorArticle float-left">
                <i>Danh mục hình vẽ:
                    @if (!is_null($picture->categories))
                        @foreach($picture->categories as $cate)
                            <a class="label label-primary taga-default" href="#" target="_blank">{{ \App\Models\Category::find($cate)->name ?? null }}</a>
                        @endforeach
                    @endif
                </i>
            </div> <br>
        </div>
    </div>
    <hr>
    <div class="contact_Pg">
        <div class="blog comment">
            <div class="titleBLog">
                <label class="detail-title">Bình Luận</label>
            </div>
            <span id="message-comment"></span>

            <div class="fb-like" data-href="http://tikz.local/pics" data-width="" data-layout="button_count" data-action="like" data-size="small" data-share="false"></div> <br>
            <div class="fb-comments" data-href="http://tikz.local/pics" data-width="600" data-numposts="5"></div>
        </div>
        <br><br>
    </div>
</div>
@endif
@endsection

@section('script')
<script>
    $(document).ready(function() {
        $('.more-picture img').click(function () {
            let url = $(this).attr('src');
            $('.picture-banner-detail img').attr('src', url);
            $('.zoomWindowContainer div').css('background-image', 'url('+url+')');
        });

        var clipboard = new ClipboardJS('#btn');
        clipboard.on('success', function(e) {
            e.clearSelection();
        });

        // $(".picture-banner-detail img").elevateZoom({easing : true, scrollZoom : true, zoomWindowWidth:500, zoomWindowHeight:400});
        // setTimeout(function () {
        //     $('.zoomContainer').eq(0).remove();
        //     $('.zoomContainer').eq(1).remove();
        // }, 1000);
    });
</script>
@endsection


