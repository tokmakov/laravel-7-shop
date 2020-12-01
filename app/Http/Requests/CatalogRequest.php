<?php

namespace App\Http\Requests;

use App\Rules\CategoryParent;
use Illuminate\Foundation\Http\FormRequest;

abstract class CatalogRequest extends FormRequest {

    /**
     * С какой сущностью сейчас работаем: категория, бренд, товар
     * @var array
     */
    protected $entity = [];

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
        switch ($this->method()) {
            case 'POST':
                return $this->createItem();
            case 'PUT':
            case 'PATCH':
                $rules = $this->updateItem();
                return $rules;
        }
    }

    /**
     * Задает дефолтные правила для проверки данных при добавлении
     * категории, бренда или товара
     */
    protected function createItem() {
        return [
            'name' => [
                'required',
                'max:100',
            ],
            'slug' => [
                'required',
                'max:100',
                'unique:'.$this->entity['table'].',slug',
                'regex:~^[-_a-z0-9]+$~i',
            ],
            'image' => [
                'mimes:jpeg,jpg,png',
                'max:5000'
            ],
        ];
    }

    /**
     * Задает дефолтные правила для проверки данных при обновлении
     * категории, бренда или товара
     */
    protected function updateItem() {
        // получаем объект модели из маршрута: admin/entity/{entity}
        $model = $this->route($this->entity['name']);
        return [
            'name' => [
                'required',
                'max:100',
            ],
            'slug' => [
                'required',
                'max:100',
                // проверка на уникальность slug, исключая эту сущность по идентифкатору
                'unique:'.$this->entity['table'].',slug,'.$model->id.',id',
                'regex:~^[-_a-z0-9]+$~i',
            ],
            'image' => [
                'mimes:jpeg,jpg,png',
                'max:5000'
            ],
        ];
    }
}
