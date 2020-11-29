@extends('layout.admin', ['title' => 'Просмотр товара'])

@section('content')
    <h1>Просмотр товара</h1>
    <div class="row">
        <div class="col-md-6">
            <p><strong>Название:</strong> {{ $product->name }}</p>
            <p><strong>ЧПУ (англ):</strong> {{ $product->slug }}</p>
            <p><strong>Бренд:</strong> {{ $product->brand->name }}</p>
            <p><strong>Категория:</strong> {{ $product->category->name }}</p>
            <p><strong>Новинка:</strong> @if($product->new) да @else нет @endif</p>
            <p><strong>Лидер продаж:</strong> @if($product->hit) да @else нет @endif</p>
            <p><strong>Распродажа:</strong> @if($product->sale) да @else нет @endif</p>
        </div>
        <div class="col-md-6">
            @php
                if ($product->image) {
                    $url = url('storage/catalog/product/image/' . $product->image);
                } else {
                    $url = url('storage/catalog/product/image/default.jpg');
                }
            @endphp
            <img src="{{ $url }}" alt="" class="img-fluid">
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <p><strong>Описание</strong></p>
            @isset($product->content)
                <p>{{ $product->content }}</p>
            @else
                <p>Описание отсутствует</p>
            @endisset
            <a href="{{ route('admin.product.edit', ['product' => $product->id]) }}"
               class="btn btn-success">
                Редактировать товар
            </a>
            <form method="post" class="d-inline" onsubmit="return confirm('Удалить этот товар?')"
                  action="{{ route('admin.product.destroy', ['product' => $product->id]) }}">
                @csrf
                @method('DELETE')
                <button type="submit" class="btn btn-danger">
                    Удалить товар
                </button>
            </form>
        </div>
    </div>
@endsection
