docker网络相关
映射主机的端口到容器的端口，格式为host_port:container_port。
--network:
启动容器并加入自定义网络
在启动容器时，使用--network选项将容器加入到自定义网络中。例如，启动两个容器分别命名为container1和container2
创建自定义网络
docker network create mynetwork
启动第一个容器，并加入自定义网络
docker run -d --name container1 --network mynetwork nginx
启动第二个容器，并加入自定义网络
docker run -d --name container2 --network mynetwork alpine sleep 1000
进入第二个容器
docker exec -it container2 /bin/sh
在第二个容器中ping第一个容器
ping container1
创建自定义网络
docker network create mynetwork
将现有容器连接到自定义网络
docker network connect mynetwork existing_container
启动新容器并连接到自定义网络
docker run -d --name new_container --network mynetwork alpine sleep 1000
进入新容器并ping现有容器
docker exec -it new_container /bin/sh
ping existing_container
docker network create mybridge
docker network inspect mybridge
docker network connect mybridge container1
docker network disconnect mybridge container1
其中127.0.0.11是Docker的内部DNS服务器地址。
docker info 可查看dns信息
安装必要的工具
apk update && apk add bind-tools
使用 nslookup 查询 DNS 信息
nslookup google.com 127.0.0.11
nslookup container1 127.0.0.11
/etc/resolve.conf
nameserver 127.0.0.11
options ndots:0
cat > /etc/resolv.conf <<hh
nameserver 127.0.0.11
options ndots:0
hh
cat > /etc/resolv.conf <<hh
nameserver 183.60.83.19
nameserver 183.60.82.98
hh
docker run --hostname=27aaf7647666 --mac-address=02:42:ac:11:00:02 --env=MYSQL_USER=sss --env=MYSQL_PASSWORD=root --env=MYSQL_ROOT_PASSWORD=root --env=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=GOSU_VERSION=1.16 --env=MYSQL_MAJOR=8.0 --env=MYSQL_VERSION=8.0.36-1.el8 --env=MYSQL_SHELL_VERSION=8.0.36-1.el8 --volume=//d/code:/webwww --volume=//d/code/mysql80:/var/lib/mysql --volume=/var/lib/mysql -p 3306:3306 --restart=no --runtime=runc -t -d mysql:8.0
dns解析速度：
dig @8.8.8.8 example.com +stats
dig @8.8.8.8 www.baidu.com +stats
dig @127.0.0.11 www.baidu.com +stats
time dig @8.8.8.8 example.com
time nslookup example.com 8.8.8.8
cat > /etc/apt/sources.list <<hh
deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb http://mirrors.aliyun.com/debian-security/ buster/updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian-security/ buster/updates main non-free contrib
hh
sudo tcpdump -i any port 53 -vvv
strace -tt -f dig @127.0.0.11 www.baidu.com
/etc/ld.so.preload
sudo ethtool -K lo tx off
sudo ethtool -K eth0 tx off
docker network ls
docker network inspect bridge
tcpdump -i any port 53 -vvv
tcpdump: listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
02:01:19.939583 IP (tos 0x0, ttl 64, id 17232, offset 0, flags [DF], proto UDP (17), length 83)
192730a2331e.45435 > dns.google.domain: [bad udp cksum 0xbc7a -> 0x3f10!] 25689+ [1au] A? wwww.baidu.com. ar: . OPT UDPsize=4096 (55)
02:01:19.939917 IP (tos 0x0, ttl 64, id 1096, offset 0, flags [DF], proto UDP (17), length 66)
192730a2331e.60630 > 183.60.83.19.domain: [bad udp cksum 0xb6a9 -> 0x218e!] 8545+ PTR? 8.8.8.8.in-addr.arpa. (38)
02:01:19.942058 IP (tos 0x0, ttl 55, id 58213, offset 0, flags [DF], proto UDP (17), length 90)
183.60.83.19.domain > 192730a2331e.60630: [udp sum ok] 8545 q: PTR? 8.8.8.8.in-addr.arpa. 1/0/0 8.8.8.8.in-addr.arpa. [20h38m43s] PTR dns.google. (62)
02:01:19.942175 IP (tos 0x0, ttl 64, id 2659, offset 0, flags [DF], proto UDP (17), length 71)
192730a2331e.51846 > 183.60.83.19.domain: [bad udp cksum 0xb6ae -> 0x35ee!] 61831+ PTR? 19.83.60.183.in-addr.arpa. (43)
02:01:19.944294 IP (tos 0x0, ttl 55, id 21293, offset 0, flags [DF], proto UDP (17), length 135)
183.60.83.19.domain > 192730a2331e.51846: [udp sum ok] 61831 NXDomain q: PTR? 19.83.60.183.in-addr.arpa. 0/1/0 ns: 60.183.in-addr.arpa. [56m50s] SOA ns.guangzhou.gd.cn. dns-admin.guangzhou.gd.cn. 8 900 600 86400 3600 (107)
02:01:20.156052 IP (tos 0xb8, ttl 49, id 17921, offset 0, flags [none], proto UDP (17), length 135)
dns.google.domain > 192730a2331e.45435: [udp sum ok] 25689 q: A? wwww.baidu.com. 3/0/1 wwww.baidu.com. [1h32m16s] CNAME ps_other.a.shifen.com., ps_other.a.shifen.com. [5m] A 220.181.38.148, ps_other.a.shifen.com. [5m] A 220.181.38.251 ar: . OPT UDPsize=512 (107)
02:01:20.156197 IP (tos 0x0, ttl 64, id 57561, offset 0, flags [DF], proto UDP (17), length 135)
127.0.0.11.domain > localhost.48185: [bad udp cksum 0xfe90 -> 0xa8f7!] 25689 q: A? wwww.baidu.com. 3/0/1 wwww.baidu.com. [1h32m16s] CNAME ps_other.a.shifen.com., ps_other.a.shifen.com. [5m] A 220.181.38.148, ps_other.a.shifen.com. [5m] A 220.181.38.251 ar: . OPT UDPsize=512 (107)
02:01:20.156384 IP (tos 0x0, ttl 64, id 41872, offset 0, flags [DF], proto UDP (17), length 69)
192730a2331e.55413 > 183.60.83.19.domain: [bad udp cksum 0xb6ac -> 0xd005!] 22516+ PTR? 11.0.0.127.in-addr.arpa. (41)
02:01:20.158463 IP (tos 0x0, ttl 55, id 60379, offset 0, flags [DF], proto UDP (17), length 128)
183.60.83.19.domain > 192730a2331e.55413: [udp sum ok] 22516 NXDomain q: PTR? 11.0.0.127.in-addr.arpa. 0/1/0 ns: 127.in-addr.arpa. [2h54m3s] SOA localhost. nobody.invalid. 1 3600 1200 604800 10800 (100)
/var/lib/docker/containers/192730a2331e52fea468ff99a1872b3ce89efd2c03ff618ac6c0f824df7475f6/resolv.conf
sudo apt install net-tools
networks: #网络配置
app_net: #网络名称
driver: bridge
ipam: #网络配置
driver: default
config:
- subnet: 192.168.10.0/24 #IP区间
Docker容器实例中解析DNS的顺序
查找Docker daemon内置的DNS服务器127.0.0.11
查找docker run创建容器实例时通过 --dns参数（容器定制）设置的DNS服务器
查找Docker daemon通过 --dns参数，或/etc/docker/daemon.json(容器通用设置)文件设置的DNS服务器
查找Docker宿主机上/etc/resolv.conf文件中配置的DNS服务器
最后，查找Google的DNS服务器，如8.8.8.8和8.8.4.4，2001:4860:4860::8888和2001:4860:4860::8844
简单来说，就是由近及远原则，内置服务器优先级最高，其次容器定制的，再其次容器通用的，最后是主机的dns。
我经常会忘记自己 docker 容器当时运行的命令，有时候来做删除或者修改之类的都是小心意义，怕一删除或修改容器坏了拉不起来，但是我又不想使用那些臃肿的管理平台，所以得另外想办法。
官方现有的 docker inspect 可以查看 Docker 的运行结构，但是这个命令不太好用，输出的内容一长串不太直观，我只想得到一个结果： 我这个容器是以什么命令Run起来的 。
百度了一下找到 python 有一个叫 Runlike 的组件，可以获取 Docke 的启动命令。

docker run -it --network alpine_net  alpine /bin/sh -c "cat /etc/resolv.conf; ping -c 4 www.google.com"

apt-get install bind-tools
apt install dnsutils
https://zjuturtle.com/2017/11/22/docker-network/
docker run -it --name my_container my_image /usr/local/bin/your_script.sh
指定目录
WORKDIR
docker run -it --name my_container -w /custom_workdir my_image /custom_workdir/your_script.sh
docker run --env-file ./path/to/.env -it my_image
每次重启容器才会加载一下
docker run --env-file ./path/to/.env -it my_image
overlay网络
#!/usr/bin/env bash
basepath=$(cd dirname $0; pwd)
docker pull registry-vpc.cn-shanghai.aliyuncs.com/namespace/project:latest
docker run --rm -i -v $basepath/.env:/opt/www/.env 
--entrypoint php registry-vpc.cn-shanghai.aliyuncs.com/namespace/project:latest 
/opt/www/bin/hyperf.php your_command
https://help.aliyun.com/zh/sls/
portainer
https://www.daocloud.io/products/index.html
https://cloud.tencent.com/document/product/614/17421