@extends('layout.admin', ['title' => 'Все товары каталога'])

@section('content')
    <h1>Все товары</h1>
    <ul>
    @foreach ($roots as $root)
        <li>
            <a href="{{ route('admin.product.category', ['category' => $root->id]) }}">
                {{ $root->name }}
            </a>
        </li>
    @endforeach
    </ul>
    <a href="{{ route('admin.product.create') }}" class="btn btn-success mb-4">
        Создать товар
    </a>
    <table class="table table-bordered">
        <tr>
            <th width="30%">Наименование</th>
            <th width="65%">Описание</th>
            <th><i class="fas fa-edit"></i></th>
            <th><i class="fas fa-trash-alt"></i></th>
        </tr>
        @foreach ($products as $product)
        <tr>
            <td>
                <a href="{{ route('admin.product.show', ['product' => $product->id]) }}">
                    {{ $product->name }}
                </a>
            </td>
            <td>{{ iconv_substr($product->content, 0, 150) }}</td>
            <td>
                <a href="{{ route('admin.product.edit', ['product' => $product->id]) }}">
                    <i class="far fa-edit"></i>
                </a>
            </td>
            <td>
                <form action="{{ route('admin.product.destroy', ['product' => $product->id]) }}"
                      method="post" onsubmit="return confirm('Удалить этот товар?')">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="m-0 p-0 border-0 bg-transparent">
                        <i class="far fa-trash-alt text-danger"></i>
                    </button>
                </form>
            </td>
        </tr>
        @endforeach
    </table>
    {{ $products->links() }}
@endsection
