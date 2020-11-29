@extends('layout.admin', ['title' => 'Редактирование категории'])

@section('content')
    <h1>Редактирование категории</h1>
    <form method="post" enctype="multipart/form-data"
          action="{{ route('admin.category.update', ['category' => $category->id]) }}">
        @method('PUT')
        @include('admin.category.part.form')
    </form>
@endsection
