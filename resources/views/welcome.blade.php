@extends('layouts.app')

@section('content')
<div class="col-lg-3 col-md-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            Категории новостей
        </div>
        <div class="panel-body">
            @php
            displayCategories($categories);
            @endphp
        </div>
    </div>
</div>
<div class="col-lg-9 col-md-9">
    <div class="panel panel-default">
        <div class="panel-heading">
            @if($sort == 'DESC')
            <b>Последние новости</b>
            <a href="{{route('welcome', 'sort=ASC')}}">Показать самые древние новости</a>
            @else
            <b>С чего всё начиналось...</b>
            <a href="{{route('welcome', 'sort=DESC')}}">Показать последние новости</a>
            @endif
        </div>
        <div class="panel-body">
            @forelse($news as $new)
            <h2><a href="{{route('news.show', $new->title_slug)}}">{{$new->title}}</a></h2>
            <p>{!! nl2br($new->announcement) !!}</p>
            @empty
            <p class="text-center">На сайте ещё нет новостей, но совсем скоро они появятся :)</p>
            @endforelse
            {!! $news->appends(['sort' => $sort])->render() !!}
        </div>
    </div>
</div>
@endsection