<?php

namespace App\Http\Requests;

class ProductCatalogRequest extends CatalogRequest {

    /**
     * С какой сущностью сейчас работаем (товар каталога)
     * @var array
     */
    protected $entity = [
        'name' => 'product',
        'table' => 'products'
    ];

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() {
        return parent::authorize();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
        return parent::rules();
    }

    /**
     * Объединяет дефолтные правила и правила, специфичные для товара
     * для проверки данных при добавлении нового товара
     */
    protected function createItem() {
        $rules = [
            'category_id' => [
                'required',
                'integer',
                'min:1'
            ],
            'brand_id' => [
                'required',
                'integer',
                'min:1'
            ],
            'price' => [
                'required',
                'numeric',
                'min:1'
            ],
        ];
        return array_merge(parent::createItem(), $rules);
    }

    /**
     * Объединяет дефолтные правила и правила, специфичные для товара
     * для проверки данных при обновлении существующего товара
     */
    protected function updateItem() {
        $rules = [
            'category_id' => [
                'required',
                'integer',
                'min:1'
            ],
            'brand_id' => [
                'required',
                'integer',
                'min:1'
            ],
            'price' => [
                'required',
                'numeric',
                'min:1'
            ],
        ];
        return array_merge(parent::updateItem(), $rules);
    }
}
