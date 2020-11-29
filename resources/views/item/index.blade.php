@extends('layout.site', ['title' => 'Все элементы'])

@section('content')
    <h1>Все элементы</h1>
    <a href="{{ route('item.create') }}" class="btn btn-success mb-4">
        Создать элемент
    </a>
    <table class="table table-bordered">
    <tr>
        <th>Наименование</th>
        <th>Временная зона</th>
        <th>Слаг (уник.)</th>
        <th>Описание</th>
        <th>Создан</th>
        <th>Изменен</th>
        <th><i class="fas fa-eye"></i></th>
        <th><i class="fas fa-edit"></i></th>
        <th><i class="fas fa-trash-alt"></i></th>
    </tr>
    @foreach($items as $item)
        <tr>
            <td>{{ $item->name }}</td>
            <td>{{ $item->timezone }}</td>
            <td>{{ $item->slug }}</td>
            <td>{{ $item->content }}</td>
            <td>{{ $item->created_at }}</td>
            <td>{{ $item->updated_at }}</td>
            <td>
                <a href="{{ route('item.show', ['item' => $item->id]) }}">
                    <i class="far fa-eye"></i>
                </a>
            </td>
            <td>
                <a href="{{ route('item.edit', ['item' => $item->id]) }}">
                    <i class="far fa-edit"></i>
                </a>
            </td>
            <td>
                <form action="{{ route('item.destroy', ['item' => $item->id]) }}"
                      method="post" onsubmit="return confirm('Удалить этот элемент?')">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="m-0 p-0 border-0 bg-transparent">
                        <i class="far fa-trash-alt text-danger"></i>
                    </button>
                </form>
            </td>
        </tr>
    @endforeach
@endsection
