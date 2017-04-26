@extends('layouts.app')

@section('content')
<div class="panel-heading text-center"><h1>Создание категории</h1></div>
<div class="panel-body col-lg-6 col-lg-offset-3 col-md-10 col-md-offset-1">
    {!! Form::open(['route' => 'categories.store', 'method' => 'post', 'class' => 'form-horizontal']) !!}
    <div class="form-group">
        {!! Form::text('title', old('title'), ['required', 'placeholder' => 'Название категории', 'class' =>
        'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::select('parent_id', $categories, old('parent_id'), ['placeholder' => 'Выберите родительскую категорию', 'class' =>
        'form-control']) !!}
    </div>
    {!! Form::submit('Добавить категорию', ['class' => 'btn btn-primary center-block']) !!}
    {!! Form::close() !!}
</div>
@endsection
