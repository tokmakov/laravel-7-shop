<?php
namespace App\Helpers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;

class ProductFilter {

    private $builder;
    private $request;

    public function __construct(Request $request) {
        $this->request = $request;
    }

    public function apply($builder) {
        $this->builder = $builder;
        foreach ($this->request->query() as $filter => $value) {
            if (method_exists($this, $filter)) {
                $this->$filter($value);
            }
        }
        return $this->builder;
    }

    private function price($value) {
        if (in_array($value, ['min', 'max'])) {
            $products = $this->builder->get();
            $count = $products->count();
            if ($count > 1) {
                $max = $this->builder->get()->max('price'); // цена самого дорогого товара
                $min = $this->builder->get()->min('price'); // цена самого дешевого товара
                $avg = ($min + $max) * 0.5;
                if ($value == 'min') {
                    $this->builder->where('price', '<=', $avg);
                } else {
                    $this->builder->where('price', '>=', $avg);
                }
            }
        }
    }

    private function new($value) {
        if ('yes' == $value) {
            $this->builder->where('new', true);
        }
    }

    private function hit($value) {
        if ('yes' == $value) {
            $this->builder->where('hit', true);
        }
    }

    private function sale($value) {
        if ('yes' == $value) {
            $this->builder->where('sale', true);
        }
    }

}
