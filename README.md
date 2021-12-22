### 版本说明(测试版本)

```
debian 系统
php 7.4
nginx 
supervisor 防止 nginx和php挂掉的守护进程

```

###  生成镜像

```

生成 镜像名字=test 版本=1.0 的镜像
 docker build -f Dockerfile -t test:1.0  .

```

###  启动容器和项目访问

```
1.先修改 docker-compose.yml 设置本地对应的项目目录到容器


2.启动容器 【记得在当前目录执行 因为你得有Dockerfile文件】
  docker-compose up -d

3.关闭容器
 docker-compose down

4.本地项目挂载到容器
 127.0.0.1 直接访问

```
