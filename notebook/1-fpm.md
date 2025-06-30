[global]
daemonize = no
[www]
listen = 9000
root@8bfc9ea7d901:/usr/local/etc/php-fpm.d# ls
docker.conf  www-show.conf  <www.conf.bak>  <www.conf.default>  zz-docker.conf
root@8bfc9ea7d901:/usr/local/etc/php-fpm.d# cat www-show.conf
[global]
log_level = notice
daemonize = yes
error_log = /webwww/log/php-fpm.log
[www]
user = www-data
group = www-data
listen = 127.0.0.1:9000
pm = dynamic
pm.max_children = 20
pm.start_servers = 20
pm.min_spare_servers = 5
pm.max_spare_servers = 35
;pm.process_idle_timeout = 300
pm.max_requests = 10000
pm.status_path = /status_show
slowlog = /webwww/log/php-fpm-slow.log
[www]
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
cat  >  www-show.conf  << EOF
[global]
log_level = notice
daemonize = yes
error_log = /webwww/log/php-fpm.log
[www]
user = www-data
group = www-data
listen = 127.0.0.1:9000
pm = dynamic
pm.max_children = 55
pm.start_servers = 40
pm.min_spare_servers = 5
pm.max_spare_servers = 55
;pm.process_idle_timeout = 300
pm.max_requests = 10000
pm.status_path = /status_show
slowlog = /webwww/log/php-fpm-slow.log
EOF
--------------------------------------------------------------------------------

pm.max_children = 300; 静态方式下开启的php-fpm进程数量
pm.start_servers = 20; 动态方式下的起始php-fpm进程数量
pm.min_spare_servers = 5; 动态方式下的最小php-fpm进程数量
pm.max_spare_servers = 35; 动态方式下的最大php-fpm进程数量
数值设置，参考自己的实际硬件配置，可以参考 总内存/30M 来计算。

# docker php-fpm配置

cat  >  www-show.conf  << EOF
[global]
log_level = notice
daemonize = yes
error_log = /webwww/log/php-fpm.log
[www]
user = www-data
group = www-data
listen = 127.0.0.1:9000
pm = dynamic
pm.max_children = 55
pm.start_servers = 40
pm.min_spare_servers = 5
pm.max_spare_servers = 55
;pm.process_idle_timeout = 300
pm.max_requests = 10000
pm.status_path = /status_show
slowlog = /webwww/log/php-fpm-slow.log
EOF

[global]
daemonize = no
[www]
listen = 9000
root@8bfc9ea7d901:/usr/local/etc/php-fpm.d# ls
docker.conf  www-show.conf  <www.conf.bak>  <www.conf.default>  zz-docker.conf
root@8bfc9ea7d901:/usr/local/etc/php-fpm.d# cat www-show.conf
[global]
log_level = notice
daemonize = yes
error_log = /webwww/log/php-fpm.log
[www]
user = www-data
group = www-data
listen = 127.0.0.1:9000
pm = dynamic
pm.max_children = 20
pm.start_servers = 20
pm.min_spare_servers = 5
pm.max_spare_servers = 35
;pm.process_idle_timeout = 300
pm.max_requests = 10000
pm.status_path = /status_show
slowlog = /webwww/log/php-fpm-slow.log
[www]
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
cat  >  www-show.conf  << EOF
[global]
log_level = notice
daemonize = yes
error_log = /webwww/log/php-fpm.log
[www]
user = www-data
group = www-data
listen = 127.0.0.1:9000
pm = dynamic
pm.max_children = 55
pm.start_servers = 40
pm.min_spare_servers = 5
pm.max_spare_servers = 55
;pm.process_idle_timeout = 300
pm.max_requests = 10000
pm.status_path = /status_show
slowlog = /webwww/log/php-fpm-slow.log
EOF
--------------------------------------------------------------------------------

pm.max_children = 300; 静态方式下开启的php-fpm进程数量
pm.start_servers = 20; 动态方式下的起始php-fpm进程数量
pm.min_spare_servers = 5; 动态方式下的最小php-fpm进程数量
pm.max_spare_servers = 35; 动态方式下的最大php-fpm进程数量
数值设置，参考自己的实际硬件配置，可以参考 总内存/30M 来计算。
