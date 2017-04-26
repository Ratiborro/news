@extends('layouts.app')

@section('content')
<div class="panel-heading text-center"><h1>Создание новости</h1></div>
<div class="panel-body col-lg-6 col-lg-offset-3 col-md-10 col-md-offset-1">
    {!! Form::open(['route' => 'news.store', 'method' => 'post', 'class' => 'form-horizontal']) !!}
    <div class="form-group">
        {!! Form::text('title', old('title'), ['required', 'placeholder' => 'Заголовок новости', 'class' =>
        'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::select('category_id', $categories, old('category'), ['required', 'placeholder' => 'Выберите категорию', 'class' =>
        'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::textarea('announcement', old('announcement'), ['required', 'placeholder' => 'Краткое описание
        новости', 'class' => 'form-control', 'rows' => '5']) !!}
    </div>
    <div class="form-group">
        {!! Form::textarea('text', old('text'), ['required', 'placeholder' => 'Текст новости', 'class' =>
        'form-control', 'rows' => '15']) !!}
    </div>
    <div class="form-group">
        {!! Form::radio('active', '0', true, ['required']) !!} Сохранить как черновик <br>
        {!! Form::radio('active', '1', false, ['required']) !!} Опубликовать
    </div>
    {!! Form::submit('Добавить новость', ['class' => 'btn btn-primary center-block']) !!}
    {!! Form::close() !!}
</div>
@endsection
