#!/bin/bash
echo "Running wrk2 test"
cd /var/www/html/laravel-11/

echo "Run static test"
echo "FPM $(date '+%d/%m/%Y %H:%M:%S')"
echo "# FPM" >> output_static.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196/api/benchmark/static" >> output_static.txt
echo "FPM+Opcache $(date '+%d/%m/%Y %H:%M:%S')"
echo "# FPM+Opcache" >> output_static.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8000/api/benchmark/static" >> output_static.txt
echo "Swoole $(date '+%d/%m/%Y %H:%M:%S')"
echo "# Swoole" >> output_static.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8001/api/benchmark/static" >> output_static.txt
echo "OpenSwoole $(date '+%d/%m/%Y %H:%M:%S')"
echo "# OpenSwoole" >> output_static.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8002/api/benchmark/static" >> output_static.txt
echo "Roadrunner $(date '+%d/%m/%Y %H:%M:%S')"
echo "# Roadrunner" >> output_static.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8003/api/benchmark/static" >> output_static.txt
echo "FrankenPHP $(date '+%d/%m/%Y %H:%M:%S')"
echo "# FrankenPHP" >> output_static.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8004/api/benchmark/static" >> output_static.txt

echo "Run http test"
echo "FPM $(date '+%d/%m/%Y %H:%M:%S')"
echo "# FPM" >> output_http.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196/api/benchmark/http-api" >> output_http.txt
echo "FPM+Opcache $(date '+%d/%m/%Y %H:%M:%S')"
echo "# FPM+Opcache" >> output_http.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8000/api/benchmark/http-api" >> output_http.txt
echo "Swoole $(date '+%d/%m/%Y %H:%M:%S')"
echo "# Swoole" >> output_http.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8001/api/benchmark/http-api" >> output_http.txt
echo "OpenSwoole $(date '+%d/%m/%Y %H:%M:%S')"
echo "# OpenSwoole" >> output_http.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8002/api/benchmark/http-api" >> output_http.txt
echo "Roadrunner $(date '+%d/%m/%Y %H:%M:%S')"
echo "# Roadrunner" >> output_http.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8003/api/benchmark/http-api" >> output_http.txt
echo "FrankenPHP $(date '+%d/%m/%Y %H:%M:%S')"
echo "# FrankenPHP" >> output_http.txt && docker run --rm --network=host cylab/wrk2 -t16 -c100 -d30s -R1000 --latency "http://34.126.91.196:8004/api/benchmark/http-api" >> output_http.txt