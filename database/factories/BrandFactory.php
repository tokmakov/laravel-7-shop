<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Brand;
use Faker\Generator as Faker;

$factory->define(Brand::class, function (Faker $faker) {
    $name = $faker->realText(rand(20, 30));
    return [
        'name' => $name,
        'content' => $faker->realText(rand(150, 200)),
        'slug' => Str::slug($name),
    ];
});
