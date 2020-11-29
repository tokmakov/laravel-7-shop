@extends('layout.admin', ['title' => 'Просмотр страницы'])

@section('content')
    <h1>Просмотр страницы</h1>
    <div class="row">
        <div class="col-12">
            <p><strong>Название:</strong> {{ $page->name }}</p>
            <p><strong>ЧПУ (англ):</strong> {{ $page->slug }}</p>
            <p><strong>Контент (html)</strong></p>
            <div class="mb-4 bg-white p-1">
                @php echo nl2br(htmlspecialchars($page->content)) @endphp
            </div>

            <a href="{{ route('admin.page.edit', ['page' => $page->id]) }}"
               class="btn btn-success">
                Редактировать страницу
            </a>
            <form method="post" class="d-inline"  onsubmit="return confirm('Удалить эту страницу?')"
                  action="{{ route('admin.page.destroy', ['page' => $page->id]) }}">
                @csrf
                @method('DELETE')
                <button type="submit" class="btn btn-danger">
                    Удалить страницу
                </button>
            </form>
        </div>
    </div>
@endsection


