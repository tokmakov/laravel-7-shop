<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(CategoryTableSeeder::class);
        $this->command->info('Таблица категорий загружена данными!');

        $this->call(BrandTableSeeder::class);
        $this->command->info('Таблица брендов загружена данными!');

        $this->call(ProductTableSeeder::class);
        $this->command->info('Таблица товаров загружена данными!');
    }
}
