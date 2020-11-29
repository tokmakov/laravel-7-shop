@extends('layout.admin', ['title' => 'Создание нового бренда'])

@section('content')
    <h1>Создание нового бренда</h1>
    <form method="post" action="{{ route('admin.brand.store') }}" enctype="multipart/form-data">
        @csrf
        @include('admin.brand.part.form')
    </form>
@endsection
