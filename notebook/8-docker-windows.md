docker run -it -d -v c:\code:/webwww --name php-cli-803 show/php-cli:8.0.3


docker run -it -d -v c:\code:/webwww --name php-cli-8026 php:8.0.26-zts-buster

// 使用php-fpm会比较稳定
docker run -it -d -v c:\code:/webwww --name php-fpm-802 php:8.0.26-fpm-buster

docker run -it -d -v c:\code:/webwww --name php-fpm-803 show/php-fpm:8.0.3


docker run -it -d -v /webwww/:/webwww  --name php-fpm-mgsdkapi show/php-fpm:8.0.3


docker pull redis:5.0.9-alpine
docker run -it -d --name redis redis:5.0.9-alpine
docker run -it -d --name redis509 -p 6379:6379 redis:5.0.9-alpine

-v //d/code:/webwww


php容器file_get_contents(): SSL: Success
php -r '$a=file_get_contents("https://www.baidu.com");var_dump($a);'
测试容器获取https
apt-get install ca-certificates
495  php -i|grep ssl
496   php -r '$a=file_get_contents("https://www.baidu.com");var_dump($a);'
497  exit
498   php -r '$a=file_get_contents("https://www.baidu.com");var_dump($a);'
499  cd /webwww/
500  ls
501  cd mg
502  ls
503  cd mgadminapi
504  ls
505  php test
506  php test.php
507  php test.php
508  cat test.php
509   php -r '$a=file_get_contents("https://www.baidu.com");var_dump($a);'
510  cat test.php
511  cd public/
512  ls
513  php test.php
514  php test.php
又OK了