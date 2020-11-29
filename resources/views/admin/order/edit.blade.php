@extends('layout.admin', ['title' => 'Редактирование заказа'])

@section('content')
    <h1 class="mb-4">Редактирование заказа</h1>
    <form method="post" action="{{ route('admin.order.update', ['order' => $order->id]) }}">
        @csrf
        @method('PUT')
        <div class="form-group">
            @php($status = old('status') ?? $order->status ?? 0)
            <select name="status" class="form-control" title="Статус заказа">
            @foreach ($statuses as $key => $value)
                <option value="{{ $key }}" @if ($key == $status) selected @endif>
                    {{ $value }}
                </option>
            @endforeach
            </select>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="name" placeholder="Имя, Фамилия"
                   required maxlength="255" value="{{ old('name') ?? $order->name ?? '' }}">
        </div>
        <div class="form-group">
            <input type="email" class="form-control" name="email" placeholder="Адрес почты"
                   required maxlength="255" value="{{ old('email') ?? $order->email ?? '' }}">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="phone" placeholder="Номер телефона"
                   required maxlength="255" value="{{ old('phone') ?? $order->phone ?? '' }}">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="address" placeholder="Адрес доставки"
                   required maxlength="255" value="{{ old('address') ?? $order->address ?? '' }}">
        </div>
        <div class="form-group">
            <textarea class="form-control" name="comment" placeholder="Комментарий"
                      maxlength="255" rows="2">{{ old('comment') ?? $order->comment ?? '' }}</textarea>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success">Сохранить</button>
        </div>
    </form>
@endsection

