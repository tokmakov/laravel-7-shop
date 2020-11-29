@extends('layout.admin')

@section('content')
    <h1>Панель управления</h1>
    <p>Добро пожаловать, {{ auth()->user()->name }}</p>
    <p>Это панель управления для администратора интернет-магазина.</p>
    <form action="{{ route('user.logout') }}" method="post">
        @csrf
        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>
@endsection
