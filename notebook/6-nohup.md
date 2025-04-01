# nohup
将程序变为守护进程
nohup xxxx &
将程序变为守护进程，执行产生的信息输出到log文件
2>&1 的作用是标准输出和标准错误同等对待，都输出到log文件
nohup xxxx > log 2>&1 &