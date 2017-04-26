@extends('layouts.app')

@section('content')
        <div class="panel-heading text-center">
            <h1>Категории новостей</h1>
        </div>
        <div class="panel-body">
            <a href="{{route('categories.create')}}" class="btn btn-block btn-primary">Создать категорию</a><br>
            @if(!empty($categories))
            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>Название</th>
                    <th>Родительская категория</th>
                    <th>Дата создания</th>
                    <th>Действия</th>
                </tr>
                @foreach($categories as $category)
                <tr>
                    <td>{{$category->id}}</td>
                    <td>{{$category->title}}</td>
                    <td>{{$category->parent->title or 'нет'}}</td>
                    <td>{{$category->created_at->format('d.m.Y H:i')}}</td>
                    <td>
                        <a href="{{route('categories.edit', $category->id)}}" class="btn btn-primary btn-xs"
                           data-toggle="tooltip" title="Редактировать" data-original-title="Edit">
                            Редактировать
                        </a>
                        <form action="{{route('categories.destroy', $category->id)}}" method="POST"
                              style="display:inline-block;">
                            {{csrf_field()}}
                            <input type="hidden" name="_method" value="DELETE">
                            <button class="btn btn-danger btn-xs btn-delete" data-toggle="tooltip" title="Удалить"
                                    data-original-title="Delete">
                                Удалить
                            </button>
                        </form>
                        <a href="{{route('categories.show', $category->id)}}" class="btn btn-default btn-xs" data-toggle="tooltip" title="Открыть" data-original-title="Open">
                            Открыть
                        </a>
                    </td>
                </tr>
                @endforeach
            </table>
            @else
            <p>Не создано ещё ни одной категории</p>
            @endif
        </div>
@endsection