<?php

use Illuminate\Database\Seeder;

class CategoryTableSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        // создать 10 категорий
        factory(App\Models\Category::class, 10)->create();
    }
}
