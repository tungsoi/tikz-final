@extends('admin.tikz.frontend.layouts.master')

@section('style')
<style>
.titleArticle a {
    font-weight: bold;
    font-size: 16px;
}
</style>

@endsection
@section('content')
@include('admin.tikz.frontend.layouts.slide')

<div class="row">
    <div class="col-md-12">
        <div class="titleBLog">
            <hr>
            {{-- <label class="detail-title uppercase">
                - danh sách hình vẽ khoa học
            </label> --}}
        </div>
    </div>
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

@if(isset($pictures) && $pictures->count() > 0)
@foreach ($pictures as $picture)

<div class="col-md-6">
    <div class="blog">

        <div class="article">
            <div class="titleBLog">
                <label class="detail-title uppercase">
                    - Hình vẽ khoa học
                </label>
            </div>
            <div class="row">
                <div class="col-sm-12 col-xs-5">
                    <div class="articleThumbnail">
                        <a href="{{ route('pic.detail', $picture->slug) }}" title="{{ $picture->title }}">
                            <div class="hw-image picture-thumnail">
                                <img

                                @if ($picture->avatar != "images/")
                                src="{{ asset($picture->avatar) }}"
                                @else
                                src="{{ asset('img/default-image.gif') }}"
                                @endif

                                alt="{{ $picture->title }}"/>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-12 col-xs-7">
                    <div class="titleArticle">
                        <a href="{{ route('pic.detail', $picture->slug) }}" class="uppercase" id="" title="{{ $picture->title }}">{{ $picture->title }}</a>
                    </div>
                    <div class="contentArticle">
                        {{ $picture->sub_title }}
                    </div>
                    <div class="otherArticle">
                        {{ date('d/m/Y', strtotime($picture->created_at)) }}
                        - {{ $picture->userCreated->name }}
                        {{-- - 300 lượt xem --}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endforeach
<div class="col-md-12">
    <br><hr>
    <center>{!! $pictures->links() !!}</center>
</div>
@else
    <div class="col-md-12">
        <br>
        <h4 class="uppercase">Không có hình vẽ nào</h4>
    </div>
@endif
</div>

@endsection
