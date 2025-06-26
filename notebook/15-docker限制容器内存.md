# 限制内存参数

-m 内存

--memory-swap 交换内存

示例
docker run --name php-dataexport-803 -it -d -m 8g --memory-swap 8g -v /webwww:/webwww show/php-fpm:8.0.3
