// 容器里增加java环境
<https://www.cnblogs.com/xyztank/articles/16342738.html>
mkdir /usr/local/java/

tar -zxvf jdk-8u191-linux-x64.tar.gz -C /usr/local/java/

ln -s /usr/local/java/jdk1.8.0_191/bin/java /usr/bin/java

java -version
