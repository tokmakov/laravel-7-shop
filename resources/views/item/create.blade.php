@extends('layout.site', ['title' => 'Создание нового элемента'])

@section('content')
    <h1>Создание нового элемента</h1>
    <form method="post" action="{{ route('item.store') }}">
        @csrf
        @include('item.part.form')
    </form>
@endsection
