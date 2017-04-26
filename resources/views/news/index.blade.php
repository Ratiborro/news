@extends('layouts.app')

@section('content')
<div class="panel-heading text-center">
    <h1>Новости</h1>
</div>
<div class="panel-body">
    <a href="{{route('news.create')}}" class="btn btn-block btn-primary">Создать новость</a><br>
    @if(!empty($news))
    <table class="table">
        <tr>
            <th>ID</th>
            <th>Название и URL</th>
            <th>Категория</th>
            <th>Анонс</th>
            <th>Полный текст</th>
            <th>Статус</th>
            <th>Действия</th>
        </tr>
        @foreach($news as $new)
        <tr>
            <td>{{$new->id}}</td>
            <td>{{$new->title}}<br><br>{{$new->title_slug}}</td>
            <td>{{$new->category->title}}</td>
            <td>{{$new->announcement}}</td>
            <td>{{$new->text}}</td>
            <td>{{ ($new->active) ? 'Опубликована ' : 'Сохранена как черновик '}} {{$new->created_at->format('d.m.Y H:i')}}</td>
            <td>
                <a href="{{route('news.edit', $new->id)}}" class="btn btn-primary btn-xs"
                   data-toggle="tooltip" title="Редактировать" data-original-title="Edit">
                    Редактировать
                </a>
                <form action="{{route('news.destroy', $new->id)}}" method="POST"
                      style="display:inline-block;">
                    {{csrf_field()}}
                    <input type="hidden" name="_method" value="DELETE">
                    <button class="btn btn-danger btn-xs btn-delete" data-toggle="tooltip" title="Удалить"
                            data-original-title="Delete">
                        Удалить
                    </button>
                </form>
                <a href="{{route('news.show', $new->title_slug)}}" class="btn btn-default btn-xs" data-toggle="tooltip" title="Открыть" data-original-title="Open">
                    Открыть
                </a>
            </td>
        </tr>
        @endforeach
    </table>
    @else
    <p>Не создано ещё ни одной </p>
    @endif
</div>
@endsection