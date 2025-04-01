# cls日志上云
日志服务
https://cloud.tencent.com/document/product/614/17421
pushLog,getConfig,agentHeartBeat权限一定要有
{
"version": "2.0",
"statement": [{
"action": [
"cls:pushLog",
"cls:getConfig",
"cls:agentHeartBeat"
],
"resource": "*",
"effect": "allow"
}]
}
如果您使用的 Loglistener 为2.6.5以前的版本，则需要加上 "cls:listLogset" 权限。
主账号ID 
用户名 clslog
登录密码 -
SecretId 
SecretKey 
wget http://mirrors.tencent.com/install/cls/loglistener-linux-x64.tar.gz && tar zxvf loglistener-linux-x64.tar.gz  -C /usr/local/ && cd /usr/local/loglistener/tools && ./loglistener.sh install
./loglistener.sh init -secretid  -secretkey  -region ap-guangzhou
loglistener-26bc356e-833f-d69d
root@testPC:/usr/local/loglistener/tools# ./loglistener.sh init -secretid  -secretkey  -region ap-guangzhou


/usr/local/loglistener/tools
/etc/loglistener.conf
/usr/local/loglistener/etc
systemctl start loglistenerd
systemctl stop loglistenerd
/etc/init.d/loglistenerd status
/etc/init.d/loglistenerd check
/etc/init.d/loglistenerd start
grep secret etc/loglistener.conf
/show# ./loglistener-check --root_dir=/usr/local/loglistener
telnet ap-guangzhou.cls.myqcloud.com 80
