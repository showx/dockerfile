# 先删除现有链接或文件
sudo rm -f /etc/localtime

# 创建新时区的符号链接（例如设置为America/New_York）
sudo ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 在某些发行版（如Debian/Ubuntu）还需要更新/etc/timezone文件
sudo sh -c "echo 'Asia/Shanghai' > /etc/timezone"

# 验证更改
date


# 快速命令
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" | sudo tee /etc/timezone