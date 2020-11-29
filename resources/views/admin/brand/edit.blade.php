@extends('layout.admin', ['title' => 'Редактирование бренда'])

@section('content')
    <h1>Редактирование бренда</h1>
    <form method="post" enctype="multipart/form-data"
          action="{{ route('admin.brand.update', ['brand' => $brand->id]) }}">
        @method('PUT')
        @include('admin.brand.part.form')
    </form>
@endsection

