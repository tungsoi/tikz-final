@extends('admin.tikz.frontend.layouts.master')

@section('content')
@include('admin.tikz.frontend.layouts.slide')


<div class="row">
@if(isset($pictures) && !is_null($pictures))
@foreach ($pictures as $picture)

<div class="col-md-6">
    <div class="blog">

        <div class="article">
            <div class="row">
                <div class="col-sm-12 col-xs-4">
                    <div class="articleThumbnail">
                        <a href="{{ route('pic.detail', $picture->slug) }}" title="{{ $picture->title }}">
                            <div class="hw-image picture-thumnail"><img src="{{ asset($picture->avatar) }}" alt="{{ $picture->title }}"/></div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-12 col-xs-8">
                    <div class="titleArticle">
                        <a href="{{ route('pic.detail', $picture->slug) }}" class="uppercase" id="" title="{{ $picture->title }}">{{ $picture->title }}</a>
                    </div>
                    <div class="contentArticle">
                        {{ $picture->sub_title }}
                    </div>
                    <div class="otherArticle">
                        {{ date('d/m/Y', strtotime($picture->created_at)) }}
                        - {{ $picture->userCreated->name }}
                        - {{ rand(10, 500) }} lượt xem
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
@endif
</div>

@endsection
