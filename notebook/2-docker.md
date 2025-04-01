docker
mysql -p 3600:3600

docker run ubuntu echo "Hello, World!"


当前dockerfile的构建：
docker build -t frontshow:v1 .
window
 winpty docker exec -it php-cli-803 bash
echo "alias docker='winpty docker'" >> ~/.bashrc

linux时区
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

镜像构建情况
docker history app


docker build -t mgsdk:v22 .

Quick\QuickDb::query('SELECT sale2_id...')

运行 docker 容器时，有时候我们希望它默认进入一个工作目录，我们可以在 docker run 命令后追加参数 -w 来实现，这样我们就不需要在启动 docker 容器后再进行一次 cd 命令了。
docker run --help 帮助中 -w 

docker run -it -d --name nginx  -v /webwww/nginx:/etc/nginx  -v /webwww:/webwww  -p 80:80 -p 443:443 nginx:1.21.0


docker run -it -d --name nginx  -v /webwww/nginx:/etc/nginx  -v /webwww:/webwww  -p 80:80 -p 443:443 nginx:1.21.0

docker run -it -d -v /webwww:/webwww -v /webwww/adsdata:/webwww/adsdata -p 8089:8089 --name php-sdk2-cronshow-803 mgsdk:v2

docker build -t mgsdk:v2 .
docker build -t mgsdk:v21 .

php-sdkv2-803



docker run -it -d -v /webwww:/webwww -v /webwww/adsdata:/webwww/adsdata -p 8089:8089 --name php-sdk21-cronshow-803 mgsdk:v21


docker run -it -d -v /webwww:/webwww -v /webwww/adsdata:/webwww/adsdata --name php-sdkv21-803 mgsdk:v21



shell获取docker IP地址
docker ps -aq| while read line
do
    docker inspect ${line}|grep \"Name\":\ \"\/
    docker inspect ${line}|grep IPAddress\"
done

内存占用
--shm-size="2g"

批量获取容器ip地址
docker inspect -f '{{.Name}} - {{.NetworkSettings.IPAddress }}' $(docker ps -aq)


docker 容器日志地址:
cd /var/lib/docker/containers/

/var/lib/docker/containers/container_id/

某用户运行docker,要将他加入一下
sudo gpasswd -a ${USER} docker


volume mac下慢
docker 访问很慢的处理
docker run --name php71 -d -v /workspace:/workspace:cached php:7.1-fpm


centos自动安装docker脚本：
curl -sSL https://get.daocloud.io/docker | sh

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun


docker port nginx
查看nginx端口的映射情况


centos docker setup:
https://www.runoob.com/docker/centos-docker-install.html

-v /src:/opt

正确运行
docker exec php-fpm bash -c "cd /webwww && ls -l"
 
docker exec -i php-fpm bash -c "cd /webwww && ls -l"

https://stackoverflow.com/questions/28037802/docker-exec-failed-cd-executable-file-not-found-in-path

docker ps 
安装ps命令:
apt-get install make
apt-get install procps
apt-get install vim
apt-get install iputils-ping
apt-get install lsof
apt-get install  net-tools   安装ifconfig
​apt-get install  telnet
​apt-get update && apt-get install procps   ps命令
docker 官方镜像很多用 debian 的？
https://www.v2ex.com/t/414239

基于容器命令的创建
docker commit container [repository:tag]

docker commit fc1 php:7.2.6
docker commit postgres show/postgres:9.6.11

-d, --detach                         Run container in background and print container ID

-w, --workdir string                 Working directory inside the container

docker stop   //终止一个docker


查看debain版本
cat /etc/debian_version
cat /etc/os-release    //VERSION_CODENAME ,这个可以查看代号



docker ps -qa

docker rm   //删除容器

--name    //自定义容器命名

--volumes-from. data     //从dbdata容挂载数据卷


容器IP的查方法
docker inspect 容器ID或容器名 |grep '"IPAddress"'


docker run -ti -d --name php php:7.2.6

--hostname=    //主机名

--add-host

进入容器
sudo docker exec -it php /bin/bash  

查看库的tags
https://hub.docker.com/r/library/php/tags/

docker pull rabbitmq:3.7.7-management

docker run -it -d --name php-fpm php:7.2-fpm

docker run -it -v /dbdata --name dbdata ubuntu

docker run -it --volumes-from dbdata --name db1 ubuntu

docker run -it --volumes-from dbdata --name db1 ubuntu

杀死所有正在运行的容器
docker kill $(docker ps -a -q)

删除所有已经停止的容器
docker rm $(docker ps -a -q)

删除所有镜像
docker rmi $(docker images -q)

sudo docker run -it -v /show:/show2 --name dbdata centos:7.3.1611
sudo docker run -it -v /show:/show2 --privileged=true --name dbdata centos:7.3.1611

sudo docker run -it --volumes-from dbdata --name db1 centos:7.3.1611

docker container ls
docker ps
docker container ls -a
docker ps -a
docker ps -a -q

docker network ls
网络的创建：
docker network create --subnet=172.18.0.0/16 mynetwork

内存和cpu的监控：
docker stats

默认挂载的路径权限为读写。如果指定为只读可以用：ro
docker run -it -v /home/dock/Downloads:/usr/Downloads:ro ubuntu64 /bin/bash

touch: cannot touch 'test': Permission denied
mac下的文件夹不能用root,使用你当前的用户名

sudo docker run -it -v /code:/webwww --name codedata centos:7.3.1611
更新系统之后：
sudo docker run -it -v /Users/pengyongsheng/code:/webwww --name codedata centos:7.3.1611

rm 之后更新一下
sudo docker run -it -d --volumes-from codedata --network mynetwork --ip 172.18.0.2 -p 80:80 --name nginx nginx:me


-----------------------------------------------------------------------
//这个是线上设置, 443要处理，不然https使用不了
docker run -it -d -v /webwww:/webwww -p 80:80 -p 443:443  --ip 172.18.0.2 --name nginx show/nginx:1.13.12

docker run -it -d -v /Users/pengyongsheng/code:/webwww -p 9501:9501 --name php-cli php:7.4.8

7.4.5比较靠谱
docker run -it -d -v /Users/pengyongsheng/code:/webwww -p 9501:9501 --name php-cli php:7.4.5



docker run -it -d -v /Users/pengyongsheng/code:/webwww --name php-fpm-748 bitnami/php-fpm:7.4.8


docker run -it -d -v /Users/pengyongsheng/code:/webwww --name php-fpm-745 php:7.4.5-fpm


【php】
show/php-fpm:7.4.5
show/php-cli:7.4.5


感觉一般的
show/php-cli:7.4.8

现有巨的docker
show/php-fpm:7.2


deluser xfs && \
    addgroup -g 33 -S www-data && adduser -u 33 -D -S -G www-data www-data
   
    groupadd -g 33 -S www-data && adduser -u 33 -D -S -G www-data www-data
   
    
 deluser xfs
/ # deluser www-data
/ # addgroup -g 33 -S www-data && adduser -u 33 -D -S -G www-data www-data
-------------------------------------------------
docker run -it -d -v /webwww:/webwww --name php-fpm-745 show/php-fpm:7.4.5
docker run -it -d -v /Users/pengyongsheng/code:/webwww --name php-fpm-745 show/php-fpm:7.4.5
docker run -it -d -v /Users/pengyongsheng/code:/webwww --name php-composer-745 show/php-fpm:7.4.5
docker run -it -d -v /Users/pengyongsheng/code:/webwww -p 80:80 --name nginx show/nginx:1.13.12
docker run -it -d -v /Users/pengyongsheng/code:/webwww -v /Users/pengyongsheng/code/mysql57:/var/lib/mysql -v /Users/pengyongsheng/code/mysqlconf/mysql:/etc/mysql -p 3307:3306 --name mysql-57 -e MYSQL_USER=root -e MYSQL_PASSWORD=root -e MYSQL_ROOT_PASSWORD=root mysql:5.7
docker run -it -d -v /Users/pengyongsheng/code:/webwww --name redis show/redis:4-alpine


-----------------------------------------------------------------------

sudo docker run -it -d /webwww:/webwww --ip 172.18.0.2 -p 80:80 --name nginx show/nginx:1.13.12

sudo docker run -it -d --volumes-from codedata --network mynetwork --ip 172.18.0.2 -p 80:80 --name nginx show/nginx:1.13.12


sudo docker run -it -d --volumes-from codedata --network docker_mynetwork --ip 172.20.0.2 -p 80:80 --name nginx show/nginx:1.13.12


sudo docker run -it -d -v /webwww:/webwww --ip 172.18.0.3 -p 9000:9000 -p 19001:19001 -p 8080:8080 -p 9501:9501 -p 9502:9502 --name php-fpm show/php-fpm:7.2


sudo docker run -it -d --volumes-from codedata --network mynetwork --ip 172.18.0.3 -p 9000:9000 -p 19001:19001 -p 8080:8080 --name php-fpm show/php-fpm:7.2

sudo docker run -it -d --volumes-from codedata --network docker_mynetwork --ip 172.20.0.3 -p 9501:9501 -p 9502:9502 -p 9000:9000 -p 19001:19001 -p 8080:8080 --name php-fpm show/php-fpm:7.2

php:7.2-fpm

sudo docker run -it -d --volumes-from codedata  --network mynetwork --ip 172.18.0.4 -p 5432:5432 --name postgres postgres:9.6.11

sudo docker run -it -d --volumes-from codedata --network mynetwork --ip 172.18.0.5 -p 6379:6379 --name redis redis:4-alpine

sudo docker run -it -d --volumes-from codedata --network docker_mynetwork --ip 172.20.0.5 -p 6379:6379 --name redis redis:4-alpine

sudo docker run -it -d --volumes-from codedata --network mynetwork --ip 172.18.0.6 -p 8888:8888 --name ssdb ssdb:show

sudo docker run -it -d --volumes-from codedata --network mynetwork --ip 172.18.0.10 --name debian debian:9.6

sudo docker run -it -d --volumes-from codedata --network mynetwork --ip 172.18.0.7 -v /Users/pengyongsheng/code/mysql:/var/lib/mysql -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=root mysql:5.6


sudo docker run -it -d --volumes-from codedata --network docker_mynetwork --ip 172.20.0.7 -v /Users/pengyongsheng/code/mysql:/var/lib/mysql -p 3306:3306 --name mysql57 -e MYSQL_USER=root -e MYSQL_PASSWORD=root -e MYSQL_ROOT_PASSWORD=root mysql:5.7


sudo docker run -it -d --volumes-from codedata --network docker_mynetwork --ip 172.20.0.7 -v /Users/pengyongsheng/code/mysql:/var/lib/mysql -v /Users/pengyongsheng/code/mysqlconf/mysql:/etc/mysql -p 3306:3306 --name mysql57 -e MYSQL_USER=root -e MYSQL_PASSWORD=root -e MYSQL_ROOT_PASSWORD=root mysql:5.7


sudo docker run -it -d --volumes-from codedata --network docker_mynetwork --ip 172.20.0.19 --name python python:3.7




sudo docker run -it -d --volumes-from codedata -p 5672:5672 -p 15672:15672 --network mynetwork --ip 172.18.0.11 --name rabbitmq -e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=admin rabbitmq:3.7.7-management

线上：
sudo docker run -it -d -v /docker/rabbitmq:/var/lib/rabbitmq -p 5672:5672 -p 15672:15672 --name rabbitmq -e RABBITMQ_DEFAULT_USER=show -e RABBITMQ_DEFAULT_PASS=yongsheng rabbitmq:3.7.7-management

-v 映射 /var/lib/rabbitmq

selenium-chrome
docker run -d -p 4444:4444 --network docker_mynetwork --ip 172.20.0.18 --name selenium-chrome -v /dev/shm:/dev/shm selenium/standalone-chrome:3.141.59-dubnium 


docker run -it -d -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home --network docker_mynetwork --ip 172.20.0.20 --name jenkins --volumes-from codedata jenkinsci/blueocean


docker run -it -d -v /webwww:/webwww --name node show/node:10.16
npm config set registry https://registry.npm.taobao.org

查看容器ip
docker inspect rabbitmq |grep IP

#ssdb需要自己创建

commit版本相关：
docker commit php-fpm show/php-fpm:7.2
docker commit nginx show/nginx:1.13.12
docker commit ssdb show/ssdb:1.0
docker commit postgres show/postgres:9.6.11
docker commit codedata show/centos:7.3.1611
docker commit mysql show/mysql:5.6
docker commit redis show/redis:4-alpine
docker commit mysql57 show/mysql57:5.7



docker push show/php-fpm:7.2
docker push postgres:9.6.11
docker push show/postgres:9.6.11
docker push show/centos:7.3.1611
docker push show/mysql:5.6
docker push show/ssdb:1.0
docker push show/redis:4-alpine
docker push  nginx:1.13.12
docker push show/nginx:1.13.12
docker push show/phpcomposer:7.4.5

执行push 需要先登录 docker login



sudo docker run -it -d --volumes-from codedata --network mynetwork --ip 172.18.0.8 -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=root mysql:5.6

docker run -p 3306:3306 --name mymysql -v $PWD/conf:/etc/mysql/conf.d -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6


docker run -p 3306:3306 --name mymysql -v $PWD/conf:/etc/mysql/conf.d -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6

不加-d，要自己启动


Nginx+PHP-fpm 出现 Primary script unknown 错误解决
https://www.jianshu.com/p/ce968818497b

File not found.
php和nginx也都要能解释这个文件夹，不然会File not found.

容固固定ip:
https://www.jianshu.com/p/19cd3654e4a4

--hostname ：指定hostname;
--net : 指定网络模式
--ip：指定IP
--add-host ：指定往/etc/hosts添加的host

提交运行中的镜像，然后再次运行container
docker commit containerid foo/live
docker run -d -p 8000:80 foo/live /bin/bash

--ip：指定IP

docker ip是根据启动的顺序来分配的

docker network -ls 查看网络方式


docker tag 要以id开头
一般命令
1.0-版本号或系统名

phpstorm docker xdebug:
http://www.mmfei.com/?p=453


http://blog.sina.com.cn/s/blog_9564cb6e0102vws9.html

xdebug.remote_port=9001 定义监听的端口
xdebug.remote_handler=dbgp,使用dbgp


link命令尽量少用，后面版本可能去除
--link链接其它容器
docker run -d -p 5601:5601 --link elasticsearch -e ELASTICSEARCH_URL=http://elasticsearch:9200 kibana


docker CMD
https://www.jianshu.com/p/78f4591b7ff0


日志
docker logs nginx


docker-compose -v
docker-compose up
docker-compose up -d  // 后台启动并运行容器



----------------------------------------------------------


解决 MacOS 下docker 启动 Kubernetes 总是 kubernetes is starting...的

在Mac上安装好docker ，再启动Kubernetes，然后一直卡在了kubernetes is starting...。

最后从网上找到了解决办法

1，git clone https://github.com/maguowei/k8s-docker-for-mac.git

2，cd k8s-docker-for-mac/

3， ./load_images.sh 同时要打开这docker desktop

4，设置 https://registry.docker-cn.com

等都安装完，重启docker desktop，静静的等待一会，你会发现k8s也运行起来了



docker logs CONTAINER 显示当前运行的容器的日志信息， UNIX 和 Linux 的命令有三种 输入输出，分别是 STDIN(标准输入)、STDOUT(标准输出)、STDERR(标准错误输出)，docker logs 显示的内容包含 STOUT 和 STDERR。在生产环境，如果我们的应用输出到我们的日志文件里，所以我们在使用 docker logs 一般收集不到太多重要的日志信息。
screen
/Users/pengyongsheng/Library/Containers/com.docker.docker/Data/vms/0

969 root      0:00 /usr/bin/containerd-shim-runc-v2 -namespace services.linuxkit -id docker -address /run/containerd/containerd.sock

所有docker都关闭版本显示




