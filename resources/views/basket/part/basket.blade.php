<a class="nav-link @if ($positions) text-success @endif"
   href="{{ route('basket.index') }}">
    Корзина
    @if ($positions) ({{ $positions }}) @endif
</a>
