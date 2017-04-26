@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Панель управления</div>

                <div class="panel-body text-center">
                    Что Вам интереснее:
                    <h2><a href="{{route('news.index')}}">Новости</a></h2> или
                    <h2><a href="{{route('categories.index')}}">Категории</a></h2>?
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
