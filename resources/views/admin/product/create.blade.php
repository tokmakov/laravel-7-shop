@extends('layout.admin', ['title' => 'Создание товара'])

@section('content')
    <h1>Создание нового товара</h1>
    <form method="post" action="{{ route('admin.product.store') }}" enctype="multipart/form-data">
        @include('admin.product.part.form')
    </form>
@endsection
