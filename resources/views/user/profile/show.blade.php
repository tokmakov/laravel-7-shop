@extends('layout.site', ['title' => 'Данные профиля'])

@section('content')
    <h1>Данные профиля</h1>

    <p><strong>Название профиля:</strong> {{ $profile->title }}</p>
    <p><strong>Имя, фамилия:</strong> {{ $profile->name }}</p>
    <p>
        <strong>Адрес почты:</strong>
        <a href="mailto:{{ $profile->email }}">{{ $profile->email }}</a>
    </p>
    <p><strong>Номер телефона:</strong> {{ $profile->phone }}</p>
    <p><strong>Адрес доставки:</strong> {{ $profile->address }}</p>
    @isset ($profile->comment)
        <p><strong>Комментарий:</strong> {{ $profile->comment }}</p>
    @endisset

    <a href="{{ route('user.profile.edit', ['profile' => $profile->id]) }}"
       class="btn btn-success">
        Редактировать профиль
    </a>
    <form method="post" class="d-inline" onsubmit="return confirm('Удалить этот профиль?')"
          action="{{ route('user.profile.destroy', ['profile' => $profile->id]) }}">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger">
            Удалить профиль
        </button>
    </form>
@endsection
