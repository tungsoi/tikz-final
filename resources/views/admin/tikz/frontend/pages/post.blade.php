@extends('admin.tikz.frontend.layouts.master')

@section('style')
<style>
.titleArticle a {
    font-weight: bold;
    font-size: 16px;
}
.mg-t-0 {
    margin-top: 0px !important;
    margin-bottom: 15px !important;
}
</style>

@endsection
@section('content')
{{-- @include('admin.tikz.frontend.layouts.slide') --}}

<div class="row">
@if (isset($tagSearch) && $tagSearch->count() > 0)
<div class="col-md-12">
    <br>
    <div class="authorArticle float-left">Thẻ đính kèm: <strong class="label label-primary uppercase">{{ $tagSearch->name }}</strong></div> <br>
</div>
@endif

@if (isset($cateSearch) && $cateSearch->count() > 0)
<div class="col-md-12">
    <br>
    <div class="authorArticle float-left">Danh mục hình vẽ: <strong class="label label-primary uppercase">{{ $cateSearch->name }}</strong></div> <br>
</div>
@endif

@if(isset($posts) && $posts->count() > 0)
@foreach ($posts as $post)

<div class="col-md-6">
    <div class="blog mg-t-0">

        <div class="article">
            <div class="row">
                <div class="col-sm-12 col-xs-4">
                    <div class="titleBLog">
                        <label class="detail-title uppercase">
                            - {{ $post->category() }}
                        </label>
                    </div>
                    <div class="articleThumbnail">
                        <a href="{{ route('post.detail', $post->slug) }}" title="{{ $post->title }}">
                            <div class="hw-image picture-thumnail">
                                <img

                                @if ($post->avatar != "images/")
                                src="{{ asset($post->avatar) }}"
                                @else
                                src="{{ asset('img/default-image.gif') }}"
                                @endif

                                alt="{{ $post->title }}"/>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-12 col-xs-8">
                    <div class="titleArticle">
                        <a href="{{ route('post.detail', $post->slug) }}" class="uppercase" id="" title="{{ $post->title }}">{{ $post->title }}</a>
                    </div>
                    <div class="contentArticle">
                        {{ $post->sub_title }}
                    </div>
                    <div class="otherArticle">
                        {{ date('d/m/Y', strtotime($post->created_at)) }}
                        - {{ $post->userCreated->name }}
                        - 300 lượt xem
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endforeach
<div class="col-md-12">
    <br><hr>
    <center>{!! $posts->links() !!}</center>
</div>
@else
    <div class="col-md-12">
        <br>
        <h4 class="uppercase">Không có bài viết nào</h4>
    </div>
@endif
</div>

@endsection
