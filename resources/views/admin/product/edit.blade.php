@extends('layout.admin', ['title' => 'Редактирование товара'])

@section('content')
    <h1>Редактирование товара</h1>
    <form method="post" enctype="multipart/form-data"
          action="{{ route('admin.product.update', ['product' => $product->id]) }}">
        @method('PUT')
        @include('admin.product.part.form')
    </form>
@endsection
