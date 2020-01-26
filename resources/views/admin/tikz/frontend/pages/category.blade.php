@extends('admin.tikz.frontend.layouts.master')

@section('style')
<style>
    .panel-primary>.panel-heading {
        color: #fff;
        background-color: #0d87c1;
        border-color: #0d87c1;
    }

    .panel-primary>.panel-heading a {
        color: white !important;
    }
</style>
@endsection

@section('content')
<div class="content" style="padding: 20px 10px;">
    <div class="titleBLog">
        <label class="detail-title">
            - {{ $title }}
        </label>
        <hr>
    </div>
</div>
@if(isset($categories) && $categories->count() > 0)
@foreach ($categories as $key => $category)

<div class="col-md-6">
    <div class="panel panel-primary">
        <div class="panel-heading uppercase">
            <a href="{{ route('pic.cate', $category->id) }}" target="_blank">{{ $key+1 .". ". $category->name }}</a>
        </div>
    </div>
</div>
@endforeach
@else
    <div class="col-md-12">
        <br>
        <h4 class="uppercase">Không có danh mục nào</h4>
    </div>
@endif
@endsection
