切换下载
cat > /etc/resolv.conf <<hh
nameserver 183.60.83.19
nameserver 183.60.82.98
hh

cat > /etc/resolv.conf <<hh
nameserver 127.0.0.11
options ndots:0
hh


php.ini
cat  >  docker-php-ext-php.ini  <<hh
[Date]
date.timezone = "asia/shanghai"
expose_php = Off
post_max_size = 1000M
upload_max_filesize = 1000M
register_globals=Off
magic_quotes_gpc=Off
open_basedir=/webwww/
log_errors = On
error_log = "/webwww/log/error_log"
error_reporting=E_ALL&~E_NOTICE
hh


php-fpm.conf
cat  >  www_show.conf  <<hh
[global]
log_level = notice
daemonize = yes
error_log = /webwww/log/php-fpm.log
[www]
catch_workers_output = yes
user = www-data
group = www-data
listen = 127.0.0.1:9000
pm = dynamic
pm.max_children = 20
pm.start_servers = 5
pm.min_spare_servers = 5
pm.max_spare_servers = 10
;pm.process_idle_timeout = 300
pm.max_requests = 10000
pm.status_path = /status_show
slowlog = /webwww/log/php-fpm-slow.log
hh

cat > docker-php-ext-sockets.ini <<hh
extension=sockets.so
extension=event.so
hh


清除history
echo > .bash_history


清除apt
RUN apt-get update && apt-get install -y \
    package-one \
    package-two 
 && rm -rf /var/lib/apt/lists/*
 
rm -rf /var/lib/apt/lists/*
 
 
 {
  "experimental": false,
  "debug": true,
  "registry-mirrors": [
    "http://ovfftd6p.mirror.aliyuncs.com",
    "http://registry.docker-cn.com",
    "http://docker.mirrors.ustc.edu.cn",
    "http://hub-mirror.c.163.com"
  ],
  "insecure-registries": [
    "registry.docker-cn.com",
    "docker.mirrors.ustc.edu.cn"
  ]
}


切换国内源加速
echo "deb http://mirrors.163.com/debian/ buster main non-free contrib" >> /etc/apt/sources.list


apt-get install libpng-dev libjpeg-dev
docker-php-ext-configure gd --with-jpeg && docker-php-ext-install gd

apt install libonig-dev
docker-php-ext-install mbstring

apt-get install libzip-dev
docker-php-ext-install zip
docker-php-ext-install sockets
docker-php-ext-install pdo_mysql
docker-php-ext-install sodium


apt-get install libevent-dev -y


docker-php-ext-install pcntl
pecl install event
pecl install swoole

apt-get install librdkafka-dev
pecl install rdkafka
pecl install redis


openssl
apt-get install libssl-dev







nginx配置
server_tokens.off;  关闭nginx版本号的显示


