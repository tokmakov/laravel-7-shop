@extends('layout.site', ['title' => 'Личный кабинет'])

@section('content')
    <h1>Личный кабинет</h1>
    <p>Добро пожаловать, {{ auth()->user()->name }}!</p>
    <p>Это личный кабинет постоянного покупателя нашего интернет-магазина.</p>
    <ul>
        <li><a href="{{ route('user.profile.index') }}">Ваши профили</a></li>
        <li><a href="{{ route('user.order.index') }}">Ваши заказы</a></li>
    </ul>
    <form action="{{ route('user.logout') }}" method="post">
        @csrf
        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>
@endsection
