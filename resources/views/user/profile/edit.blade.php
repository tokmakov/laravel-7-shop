@extends('layout.site', ['title' => 'Редактирование профиля'])

@section('content')
    <h1>Редактирование профиля</h1>
    <form method="post" action="{{ route('user.profile.update', ['profile' => $profile->id]) }}">
        @method('PUT')
        @include('user.profile.part.form')
    </form>
@endsection
