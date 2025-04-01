node环境配置
npm config set registry https://registry.npm.taobao.org
apt-get update && apt-get install -y ca-certificates && update-ca-certificates
npm config set strict-ssl false
docker pull node:22.2-slim
docker run -it -d -v //d/code/:/webwww --name node222slim node:22.2-slim
"data-root": "D:\dockerdata",
rmdir "C:\Users\Administrator\AppData\Local\Docker\wsl\data"
mklink /J "C:\Users\Administrator\AppData\Local\Docker\wsl\data" "D:\Docker\wsl\data"
npm install vue-style-loader --save-dev
Ensure Python is installed
sudo apt-get update
sudo apt-get install python3 build-essential
Set Python path for node-gyp
export PYTHON=$(which python3)
Make the change permanent by adding to shell configuration file
echo 'export PYTHON=$(which python3)' >> ~/.bashrc
source ~/.bashrc
docker run --hostname=cad51b3f2a1c --mac-address=02:42:ac:11:00:02 --env=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=NODE_VERSION=22.2.0 --env=YARN_VERSION=1.22.19 --volume=//d/code/:/webwww --restart=no --runtime=runc -t -d node:22.2-slim
docker run --name node -it -d -v //d/code:/webwww -p 8080:8080 -p 8081:8081 node:22.2-slim