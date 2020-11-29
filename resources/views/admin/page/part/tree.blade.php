@php($level++)
@foreach($pages->where('parent_id', $parent) as $page)
    <tr>
        <td>{{ $page->id }}</td>
        <td>
            @if ($level)
                {{ str_repeat('—', $level) }}
            @endif
            <a href="{{ route('admin.page.show', ['page' => $page->id]) }}"
               style="font-weight:@if($level) normal @else bold @endif">
                {{ $page->name }}
            </a>
        </td>
        <td>{{ $page->slug }}</td>
        <td>
            <a href="{{ route('admin.page.edit', ['page' => $page->id]) }}">
                <i class="far fa-edit"></i>
            </a>
        </td>
        <td>
            <form action="{{ route('admin.page.destroy', ['page' => $page->id]) }}"
                  method="post" onsubmit="return confirm('Удалить эту страницу?')">
                @csrf
                @method('DELETE')
                <button type="submit" class="m-0 p-0 border-0 bg-transparent">
                    <i class="far fa-trash-alt text-danger"></i>
                </button>
            </form>
        </td>
    </tr>
    @if (count($pages->where('parent_id', $parent)))
        @include('admin.page.part.tree', ['level' => $level, 'parent' => $page->id])
    @endif
@endforeach
