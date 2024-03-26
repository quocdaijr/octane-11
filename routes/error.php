<?php

/**
 * Author: quocdaijr
 * Time: 3/25/24 11:37 PM
 */

use Illuminate\Container\Container;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;

/**
 * Global states error
 */
class GlobalStateService
{
    public static int $count = 0;

    public static array $data = [];
}

Route::get('errors/global-states', function () {
    GlobalStateService::$count++;
    GlobalStateService::$data[] = GlobalStateService::$count;
    return response()->json([
        'message' => 'Global states error',
        'data' => [
            'count' => GlobalStateService::$count,
            'data' => GlobalStateService::$data,
        ],
    ]);
});

/**
 * Dependency injection
 */
class TestService
{
    public function __construct(
        private $app
    ) {
    }

    public function get(): string
    {
        return $this->app->environment();
    }
}

class TestServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        /**
         * Nếu một service có Application instance trong __construct, hãy đảm bảo rằng bạn sử dụng instance
         * được truyền vào từ tham số trong callback chứ không phải là instance được lấy trực tiếp từ trong Service Provider.
         */
        // Not use in Octane
        $this->app->bind(TestService::class, function () {
            return new TestService($this->app);
        });
        // Change to this
        // send $app to closure, not use $this->app
        $this->app->bind(TestService::class, function (Application $app) {
            return new TestService($app);
        });

        /**
         * Không truyền instance đến các singleton, thay vào đó hãy truyền một callback trả về một instance.
         */

        // Not use in Octane
        $this->app->singleton(TestService::class, function (Application $app) {
            return new TestService($app);
        });
        // Change to this
        $this->app->bind(TestService::class, function (Application $app) {
            return new TestService($app);
        });
        // or
        $this->app->singleton(TestService::class, function (Application $app) {
            return new TestService(fn() => Container::getInstance());
        });

        // Not use in Octane
        $this->app->singleton(TestService::class, function (Application $app) {
            return new TestService($app['request']);
        });
        // Change to this
        $this->app->bind(TestService::class, function (Application $app) {
            return new TestService($app['request']);
        });
        // or
        $this->app->singleton(TestService::class, function (Application $app) {
            return new TestService(fn() => $app['request']);
        });

        // Not use in Octane
        $this->app->singleton(TestService::class, function (Application $app) {
            return new TestService($app->make('config'));
        });
        // Change to this
        $this->app->bind(TestService::class, function (Application $app) {
            return new TestService($app->make('config'));
        });
        // or
        $this->app->singleton(TestService::class, function (Application $app) {
            return new TestService(fn() => Container::getInstance()->make('config'));
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}

