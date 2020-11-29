@extends('layout.site', ['title' => 'Редактирование элемента'])

@section('content')
    <h1>Редактирование элемента</h1>
    <form method="post" action="{{ route('item.update', ['item' => $item->id]) }}">
        @method('PUT')
        @include('item.part.form')
    </form>
@endsection

