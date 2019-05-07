---
title: linux服务器docker使用指南
date: 2019-05-07 21:32:54
categories: 学习笔记
tags: 
    - linux
    - docker
description: docker镜像的拉取与管理; docker容器的创建与管理。
---

## Docker介绍
Docker是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后在linux服务器上发布、使用。

通俗地说，docker就是一个帮你配好环境的的微型操作系统。例如我们需要使用某个应用，但是让这个应用运行需要配置很多环境，很麻烦。这个时候docker出来说它都帮你搞定了，你只要把这个docker镜像从远程仓库pull下来，然后创建容器，即可使用。岂不美哉？

docker镜像：静态环境，就像是还没运行的代码。  
docker容器：运行镜像得到的微型操作系统，就像代码运行的程序。


## Docker使用

### 镜像拉取与管理
镜像在拉取下来后，即可使用。需要注意的是镜像里面的环境是固定不变的，在创建容器后如果改变了该镜像的一些环境，如新增加包或更新包等，并不会写入到镜像中。如果需要使用新环境，则需要将容器commit成一个新镜像。


* 拉取第三方镜像，镜像在https://hub.docker.com/
    
        docker pull repo/name:tag 
* 查看已安装的镜像列表

        docker images 
* 删除镜像

        docker rmi [image_id] 
* 更改镜像名称/tag

        (这个操作相当于新建了一个指针指向同一个镜像，固原来的指针还在)
        docker tag [image_id] new_repo/new_name:new_tag 
        docker rmi old_repo/old_nam:old_tag
        (删除旧镜像指针)

* 运行镜像，创建容器
    1. 正常创建并进入(需要用显卡则用nvidia-docker)

            docker (nvidia-docker) run -it image-name:tag/image-id bash
    2. 使用root权限创建并进入

            /usr/bin/docker run (--runtime=nvidia) -it image-name:tag/image-id bash

    2. 挂载本地目录到docker容器：加-v参数

            -v /local_path:/remote_path 

    3. 给容器起名字：加--name参数

            --name jack-pytorch
    4. 与服务器共享全部内存：加--ipc=host （场景：pytorch num_workers>0必须加这个参数创建容器）

            --ipc=host

    5. **结合起来一般如下使用**

            nvidia-docker run -it -v /local_path:/remote_path --name jack-pytorch --ipc=host image-name:tag/image-id bash



### 容器管理
容器在创建后会一直存在，退出容器不会删除，除非手动删除。

* 退出容器

        键入exit或者ctrl-D
* 启动容器

        docker container start [container_id]
* 进入容器

        docker attach [container_id]
* 删除容器

        docker container rm [container_id]
* 列出所有容器

        docker container ls -a
* **将容器commit成镜像**

        docker commit [container_id] new_repo/new_name:new_tag
        e.g. docker commit e21e8bfd7c99 deepmo/pytorch-cuda9.0:lastest


## Docker进阶

### 服务器安装Docker
暂略

### docker权限管理

* 将用户添加到docker组

        1. sudo groupadd docker (添加docker group,已有就跳过)
        2. sudo gpasswd -a ${USER} docker (将当前用户添加到docker组)
        3. 重新用ssh连接服务器即可

### 创建DockerFile
暂略