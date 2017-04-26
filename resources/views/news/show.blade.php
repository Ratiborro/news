@extends('layouts.app')

@section('content')
<div class="row">
    <div class="panel-heading text-center">
        <h1>{{$news->title}}</h1>
        <p>{{$news->created_at->format('d.m.Y')}}</p>
    </div>
    <div class="panel-body col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <p>{!! nl2br($news->text) !!}</p>
        <p><a href="{{route('welcome')}}">Вернуться к списку новостей</a></p>
        <hr>
        <div class="panel-heading text-center"><h2>Оставить комментарий</h2></div>
        <div class="panel-body col-lg-6 col-lg-offset-3 col-md-10 col-md-offset-1">
            {!! Form::open(['route' => ['comments.store', $news->id], 'method' => 'post', 'class' => 'form-horizontal'])
            !!}
            <div class="form-group">
                {!! Form::text('name', old('name'), ['required', 'placeholder' => 'Имя', 'class' =>
                'form-control']) !!}
            </div>
            <div class="form-group">
                {!! Form::textarea('text', old('text'), ['required', 'placeholder' => 'Текст комментария', 'class' =>
                'form-control']) !!}
            </div>
            {!! Form::submit('Добавить комментарий', ['class' => 'btn btn-primary center-block']) !!}
            {!! Form::close() !!}
        </div>
    </div>
</div>
<div class="row">
    @foreach($news->comments as $comment)
    <div class="container">
        <p><b>{{$comment->name}}</b></p>
        <p>{!! nl2br($comment->text) !!}</p>
    </div>
    <hr>
    @endforeach
</div>
@endsection