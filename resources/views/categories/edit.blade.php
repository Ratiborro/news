@extends('layouts.app')

@section('content')
<div class="panel-heading text-center"><h1>Редактирование категории</h1></div>
<div class="panel-body col-lg-6 col-lg-offset-3 col-md-10 col-md-offset-1">
    {!! Form::model($category, ['route' => ['categories.update', $category->id], 'method' => 'put', 'class' =>
    'form-horizontal']) !!}
    <div class="form-group">
        {!! Form::text('title', old('title'), ['required', 'placeholder' => 'Заголовок категории', 'class' =>
        'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::select('parent_id', $categories, old('parent_id'), ['placeholder' => 'Выберите родительскую категорию', 'class' =>
        'form-control']) !!}
    </div>
    {!! Form::submit() !!}
    {!! Form::close() !!}
</div>
@endsection