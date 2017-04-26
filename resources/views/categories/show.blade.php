@extends('layouts.app')

@section('content')
<div class="panel-heading text-center">
    <h1>{{$category->title}}</h1>
</div>
<div class="panel-body col-lg-6 col-lg-offset-3 col-md-10 col-md-offset-1">
    @forelse($category->news as $news)
    <h2><a href="{{route('news.show',$news->title_slug)}}">{{$news->title}}</a></h2>
    <p>{{$news->announcement}}</p>
    @empty
    <p class="text-center">В данной категории ещё нет новостей</p>
    @endforelse
</div>
@endsection