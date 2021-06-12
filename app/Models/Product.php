<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Stem\LinguaStemRu;

class Product extends Model {

    protected $fillable = [
        'category_id',
        'brand_id',
        'name',
        'slug',
        'content',
        'image',
        'price',
        'new',
        'hit',
        'sale',
    ];

    /**
     * Связь «товар принадлежит» таблицы `products` с таблицей `categories`
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function category() {
        return $this->belongsTo(Category::class);
    }

    /**
     * Связь «товар принадлежит» таблицы `products` с таблицей `brands`
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function brand() {
        return $this->belongsTo(Brand::class);
    }

    /**
     * Связь «многие ко многим» таблицы `products` с таблицей `baskets`
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function baskets() {
        return $this->belongsToMany(Basket::class)->withPivot('quantity');
    }

    /**
     * Позволяет выбирать товары категории и всех ее потомков
     *
     * @param \Illuminate\Database\Eloquent\Builder $builder
     * @param integer $id
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeCategoryProducts($builder, $id) {
        $descendants = Category::getAllChildren($id);
        $descendants[] = $id;
        return $builder->whereIn('category_id', $descendants);
    }

    /**
     * Позволяет фильтровать товары по нескольким условиям
     *
     * @param \Illuminate\Database\Eloquent\Builder $builder
     * @param \App\Helpers\ProductFilter $filters
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeFilterProducts($builder, $filters)
    {
        return $filters->apply($builder);
    }

    /**
     * Позволяет искать товары по заданным словам
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     * @param string $search
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeSearch($query, $search) {
        // обрезаем поисковый запрос
        $search = iconv_substr($search, 0, 64);
        // удаляем все, кроме букв и цифр
        $search = preg_replace('#[^0-9a-zA-ZА-Яа-яёЁ]#u', ' ', $search);
        // сжимаем двойные пробелы
        $search = preg_replace('#\s+#u', ' ', $search);
        $search = trim($search);
        if (empty($search)) {
            return $query->whereNull('id'); // возвращаем пустой результат
        }
        // разбиваем поисковый запрос на отдельные слова
        $temp = explode(' ', $search);
        $words = [];
        $stemmer = new LinguaStemRu();
        foreach ($temp as $item) {
            if (iconv_strlen($item) > 3) {
                // получаем корень слова
                $words[] = $stemmer->stem_word($item);
            } else {
                $words[] = $item;
            }
        }
        $relevance = "IF (`products`.`name` LIKE '%" . $words[0] . "%', 2, 0)";
        $relevance .= " + IF (`products`.`content` LIKE '%" . $words[0] . "%', 1, 0)";
        $relevance .= " + IF (`categories`.`name` LIKE '%" . $words[0] . "%', 1, 0)";
        $relevance .= " + IF (`brands`.`name` LIKE '%" . $words[0] . "%', 2, 0)";
        for ($i = 1; $i < count($words); $i++) {
            $relevance .= " + IF (`products`.`name` LIKE '%" . $words[$i] . "%', 2, 0)";
            $relevance .= " + IF (`products`.`content` LIKE '%" . $words[$i] . "%', 1, 0)";
            $relevance .= " + IF (`categories`.`name` LIKE '%" . $words[$i] . "%', 1, 0)";
            $relevance .= " + IF (`brands`.`name` LIKE '%" . $words[$i] . "%', 2, 0)";
        }

        $query->join('categories', 'categories.id', '=', 'products.category_id')
            ->join('brands', 'brands.id', '=', 'products.brand_id')
            ->select('products.*', DB::raw($relevance . ' as relevance'))
            ->where('products.name', 'like', '%' . $words[0] . '%')
            ->orWhere('products.content', 'like', '%' . $words[0] . '%')
            ->orWhere('categories.name', 'like', '%' . $words[0] . '%')
            ->orWhere('brands.name', 'like', '%' . $words[0] . '%');
        for ($i = 1; $i < count($words); $i++) {
            $query = $query->orWhere('products.name', 'like', '%' . $words[$i] . '%');
            $query = $query->orWhere('products.content', 'like', '%' . $words[$i] . '%');
            $query = $query->orWhere('categories.name', 'like', '%' . $words[$i] . '%');
            $query = $query->orWhere('brands.name', 'like', '%' . $words[$i] . '%');
        }
        $query->orderBy('relevance', 'desc');
        return $query;
    }
}
