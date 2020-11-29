<?php

use Illuminate\Database\Seeder;

class BrandTableSeeder extends Seeder {
    public function run() {
        // создать 10 брендов
        factory(App\Models\Brand::class, 10)->create();
    }
}
