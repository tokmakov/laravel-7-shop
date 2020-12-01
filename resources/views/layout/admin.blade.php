<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{csrf_token() }}">
    <title>{{ $title ?? 'Панель управления' }}</title>

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"/>
    <link rel="stylesheet" href="{{ asset('css/admin.css') }}"/>

    <script src="{{ asset('js/app.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ru-RU.min.js"></script>
    <script src="{{ asset('js/admin.js') }}"></script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <!-- Бренд и кнопка «Гамбургер» -->
        <a class="navbar-brand" href="{{ route('admin.index') }}">Панель управления</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbar-example" aria-controls="navbar-example"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Основная часть меню (может содержать ссылки, формы и прочее) -->
        <div class="collapse navbar-collapse" id="navbar-example">
            <!-- Этот блок расположен слева -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('admin.order.index') }}">Заказы</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('admin.user.index') }}">Пользователи</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('admin.category.index') }}">Категории</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('admin.brand.index') }}">Бренды</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('admin.product.index') }}">Товары</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('admin.page.index') }}">Страницы</a>
                </li>
            </ul>

            <!-- Этот блок расположен справа -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a onclick="document.getElementById('logout-form').submit(); return false"
                       href="{{ route('user.logout') }}" class="nav-link">Выйти</a>
                </li>
            </ul>
            <form id="logout-form" action="{{ route('user.logout') }}" method="post"
                  class="d-none">
                @csrf
            </form>
        </div>
    </nav>

    <div class="row">
        <div class="col-12">
            @if ($message = Session::get('success'))
                <div class="alert alert-success alert-dismissible mt-0" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Закрыть">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    {{ $message }}
                </div>
            @endif

            @if ($errors->any())
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Закрыть">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <ul class="mb-0">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            @yield('content')
        </div>
    </div>
</div>
</body>
</html>
