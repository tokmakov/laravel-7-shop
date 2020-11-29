<!-- цена (руб) -->
<select name="price" class="form-control d-inline w-25 mr-4" title="Цена">
    <option value="0">Выберите цену</option>
    <option value="min"@if(request()->price == 'min') selected @endif>Дешевые товары</option>
    <option value="max"@if(request()->price == 'max') selected @endif>Дорогие товары</option>
</select>
<!-- новинка -->
<div class="form-check form-check-inline">
    <input type="checkbox" name="new" class="form-check-input" id="new-product"
           @if(request()->has('new')) checked @endif value="yes">
    <label class="form-check-label" for="new-product">Новинка</label>
</div>
<!-- лидер продаж -->
<div class="form-check form-check-inline">
    <input type="checkbox" name="hit" class="form-check-input" id="hit-product"
           @if(request()->has('hit'))  checked @endif value="yes">
    <label class="form-check-label" for="hit-product">Лидер продаж</label>
</div>
<!-- распродажа -->
<div class="form-check form-check-inline ">
    <input type="checkbox" name="sale" class="form-check-input" id="sale-product"
           @if(request()->has('sale'))  checked @endif value="yes">
    <label class="form-check-label" for="sale-product">Распродажа</label>
</div>
<button type="submit" class="btn btn-light">Фильтровать</button>

