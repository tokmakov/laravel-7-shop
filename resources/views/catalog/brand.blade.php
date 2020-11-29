@extends('layout.site', ['title' => $brand->name])

@section('content')
    <h1>{{ $brand->name }}</h1>
    <p>{{ $brand->content }}</p>
    <div class="bg-info p-2 mb-4">
        <!-- Фильтр для товаров бренда -->
        <form method="get"
              action="{{ route('catalog.brand', ['brand' => $brand->slug]) }}">
            @include('catalog.part.filter')
            <a href="{{ route('catalog.brand', ['brand' => $brand->slug]) }}"
               class="btn btn-light">Сбросить</a>
        </form>
    </div>
    <div class="row">
        @foreach ($products as $product)
            @include('catalog.part.product', ['product' => $product])
        @endforeach
    </div>
    {{ $products->links() }}
@endsection
