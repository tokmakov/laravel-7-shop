<?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider {
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        Schema::defaultStringLength(191);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot() {
        Blade::directive('icon', function($expression) {
            $name = str_replace("'", '', $expression);
            return '<i class="fas fa-' . $name . '"></i>';
        });
        Blade::directive('price', function($expression) {
            return "<?php echo number_format($expression, 2, '.', ''); ?>";
        });
        Blade::if('admin', function() {
            return ! auth()->check() && auth()->user()->admin;
        });
    }
}
