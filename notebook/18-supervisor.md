# 安装

apt-get update
apt-get install -y supervisor

1. 重启 supervisord 进程本身
supervisorctl reload   # 重新加载配置并重启所有进程
supervisorctl reread   # 重新读取配置文件
supervisorctl update   # 更新配置并重启受影响的程序
2. 重启特定的程序
supervisorctl restart <program_name>   # 重启指定程序
supervisorctl restart all              # 重启所有程序
3. 如果想完全重启 supervisord，可以这样操作
pkill supervisord
supervisord -c /etc/supervisor/supervisord.conf

1. 先停止可能运行的 supervisor 进程
pkill supervisord
2. 确保目录存在
mkdir -p /var/run/supervisor
mkdir -p /var/log/supervisor
3. 修改 supervisord.conf 配置
cat > /etc/supervisor/supervisord.conf << 'EOF'
[unix_http_server]
file=/var/run/supervisor/supervisor.sock
chmod=0700
[supervisord]
logfile=/var/log/supervisor/supervisord.log
pidfile=/var/run/supervisor/supervisord.pid
childlogdir=/var/log/supervisor
nodaemon=false
[rpcinterface:supervisor]
supervisor.rpcinterface_factory=supervisor.rpcinterface:make_main_rpcinterface
[supervisorctl]
serverurl=unix:///var/run/supervisor/supervisor.sock
[include]
files = /etc/supervisor/conf.d/*.conf
EOF
4. 重新启动 supervisord
supervisord -c /etc/supervisor/supervisord.conf
5. 现在应该可以使用 supervisorctl 了
supervisorctl status

修改 supervisord.conf 配置
cat > /etc/supervisor/supervisord.conf << 'EOF'
[unix_http_server]
file=/var/run/supervisor/supervisor.sock
chmod=0700
[inet_http_server]
port=9001
username=ishengsheng        ; 设置访问用户名
password=yongshengxx1      ; 设置访问密码
[supervisord]
logfile=/var/log/supervisor/supervisord.log
pidfile=/var/run/supervisor/supervisord.pid
childlogdir=/var/log/supervisor
nodaemon=false
[rpcinterface:supervisor]
supervisor.rpcinterface_factory=supervisor.rpcinterface:make_main_rpcinterface
[supervisorctl]
serverurl=unix:///var/run/supervisor/supervisor.sock
[include]
files = /etc/supervisor/conf.d/*.conf
EOF
重启 supervisord
supervisord -c /etc/supervisor/supervisord.conf

开启web情况下的nginx配置
upstream mgsupervisor01 {
    server php803ssl:9001;
}
server {
    server_name supervisor01.x7t.cn;
    listen 80;
    location / {
        proxy_pass <http://mgsupervisor01/>;  # 注意这里末尾加了 /
    }
}

cron的配置
cat > /etc/supervisor/conf.d/cron.conf << 'EOF'
[program:mgcron]
command=/usr/local/bin/php /www/mg/mgadminapi/bin/silang "mg\process\Cron@run"
directory=/www/mg/mgadminapi
user=www-data
autostart=true
autorestart=true
startretries=3
redirect_stderr=true
stdout_logfile=/var/log/supervisor/mgcron.log
stderr_logfile=/var/log/supervisor/mgcron.err
stdout_logfile_maxbytes=50MB
stdout_logfile_backups=10
EOF

cat > /etc/supervisor/conf.d/mgcron.conf << 'EOF'
[program:mgcron]
command=/usr/local/bin/php /webwww/www/sdk/bin/silang "mg\process\Cron@run"
directory=/webwww/www/sdk
user=www-data
autostart=true
autorestart=true
startretries=3
redirect_stderr=true
stdout_logfile=/var/log/supervisor/mgcron.log
stderr_logfile=/var/log/supervisor/mgcron.err
stdout_logfile_maxbytes=50MB
stdout_logfile_backups=10
EOF

每次修改完cron配置之后，要修改一下

1. 更新配置
supervisorctl update
2. 检查状态
supervisorctl status
3. 如果没有自动启动，手动启动
supervisorctl start mgcron
