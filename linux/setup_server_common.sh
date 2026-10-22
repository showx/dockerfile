#!/bin/bash

# =================================================================
# 服务器一键环境搭建脚本
# 包含：系统更新, Nginx, Nginx API配置, Supervisor, SSH配置, Redis, 目录创建, Supervisor服务配置
# =================================================================

# 检查是否以 root 权限运行
if [[ $EUID -ne 0 ]]; then
   echo "错误：此脚本必须以 root 权限运行！"
   exit 1
fi

set -e # 遇到错误立即停止执行

echo ">>> [1/5] 正在更新系统软件包..."
apt-get update -y
apt-get upgrade -y

echo ">>> [2/5] 正在安装并启动 Nginx..."
apt install nginx -y
systemctl enable nginx
systemctl start nginx
systemctl status nginx --no-pager

echo ">>> [3/5] 正在安装并启动 Supervisor..."
apt-get install supervisor -y
systemctl enable supervisor
systemctl start supervisor

echo ">>> [4/5] 正在配置 SSH (用于 SFTP)..."
# 备份原始配置
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# 修改 PasswordAuthentication
if grep -q "^PasswordAuthentication" /etc/ssh/sshd_config; then
    sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
else
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
fi

# 增加 PubkeyAcceptedAlgorithms
if ! grep -q "PubkeyAcceptedAlgorithms +ssh-rsa" /etc/ssh/sshd_config; then
    echo "PubkeyAcceptedAlgorithms +ssh-rsa" >> /etc/ssh/sshd_config
fi

echo ">>> [5/5] 正在安装并启动 Redis..."
apt install redis-server -y
systemctl enable redis-server
systemctl start redis-server

systemctl restart sshd
echo "SSH 配置已更新并重启。"