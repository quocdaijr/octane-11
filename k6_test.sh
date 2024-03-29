#!/bin/bash
echo "Running k6 cloud test"
cd /var/www/html/laravel-11/

echo "Run FPM static test"
k6 cloud -e URL=http://34.126.91.196/api/benchmark/static -e TYPE=FPM script.js
echo "Run FPM http test"
k6 cloud -e URL=http://34.126.91.196/api/benchmark/http-api -e TYPE=FPM script.js

echo "Run FPM+OPcache static test"
k6 cloud -e URL=http://34.126.91.196:8000/api/benchmark/static -e TYPE=FPM+Opcache script.js
echo "Run FPM+OPcache http test"
k6 cloud -e URL=http://34.126.91.196:8000/api/benchmark/http-api -e TYPE=FPM+Opcache script.js

echo "Run Swoole static test"
k6 cloud -e URL=http://34.126.91.196:8001/api/benchmark/static -e TYPE=Swoole script.js
echo "Run Swoole http test"
k6 cloud -e URL=http://34.126.91.196:8001/api/benchmark/http-api -e TYPE=Swoole script.js

echo "Run OpenSwoole static test"
k6 cloud -e URL=http://34.126.91.196:8002/api/benchmark/static -e TYPE=OpenSwoole script.js
echo "Run OpenSwoole http test"
k6 cloud -e URL=http://34.126.91.196:8002/api/benchmark/http-api -e TYPE=OpenSwoole script.js

echo "Run Roadrunner static test"
k6 cloud -e URL=http://34.126.91.196:8003/api/benchmark/static -e TYPE=Roadrunner script.js
echo "Run Roadrunner http test"
k6 cloud -e URL=http://34.126.91.196:8003/api/benchmark/http-api -e TYPE=Roadrunner script.js

echo "Run FrankenPHP static test"
k6 cloud -e URL=http://34.126.91.196:8004/api/benchmark/static -e TYPE=FrankenPHP script.js
echo "Run FrankenPHP http test"
k6 cloud -e URL=http://34.126.91.196:8004/api/benchmark/http-api -e TYPE=FrankenPHP script.js