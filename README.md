### 版本说明

```
debian 系统
php 7.4
nginx 最新
supervisor 防止 nginx和php挂掉的守护进程

```

###  Dockerfile生成镜像

```
//生成 镜像名字 test 版本 1.0 的镜像
docker build -f Dockerfile -t test:1.0  .

```

###  docker-compose.yml启动容器+运行项目

```
本地项目挂载到容器
127.0.0.1 直接访问

```