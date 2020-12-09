@extends('layout.site', ['title' => 'Создание профиля'])

@section('content')
    <h1>Создание профиля</h1>
    <form method="post" action="{{ route('user.profile.store') }}">
        @include('user.profile.part.form')
    </form>
@endsection
