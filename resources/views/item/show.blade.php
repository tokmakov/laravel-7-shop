@extends('layout.site', ['title' => 'Просмотр элемента'])

@section('content')
    <h1>Просмотр элемента</h1>
    <p><strong>Название:</strong> {{ $item->name }}</p>
    <p><strong>Временная зона:</strong> {{ $item->timezone }}</p>
    <p><strong>ЧПУ (англ):</strong> {{ $item->slug }}</p>
    <p><strong>Описание</strong> {{ $item->content }}</p>
    <p><strong>Создан</strong> {{ $item->created_at }}</p>
    <p><strong>Исправлен</strong> {{ $item->updated_at }}</p>
    <a href="{{ route('item.edit', ['item' => $item->id]) }}"
       class="btn btn-success">
        Редактировать
    </a>
    <form method="post" class="d-inline" onsubmit="return confirm('Удалить этот элемент?')"
          action="{{ route('item.destroy', ['item' => $item->id]) }}">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger">
            Удалить
        </button>
    </form>
@endsection


