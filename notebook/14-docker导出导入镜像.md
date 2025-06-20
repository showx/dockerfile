# 导出

docker save -o <输出文件名>.tar <镜像名>:<标签>

docker save -o my_ubuntu_image.tar ubuntu:20.04

# 导入

docker load -i <文件名>.tar

docker load -i my_ubuntu_image.tar

# 正在运行的容器

提交为镜像
docker commit <容器ID> <新镜像名>:<标签>
