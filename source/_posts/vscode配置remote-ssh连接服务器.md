---
title: vscode配置remote-ssh连接服务器
date: 2021-10-02 12:08:56
categories: 使用指南
tags: ssh
description:
---


## vs code连接远程服务器

### 本地ssh配置
1. 将自己的ssh公私钥放在用户ssh目录下,如C:\Users\deepmo\.ssh
2. vscode配置
    * 安装remote ssh插件
    * 左侧栏“远程资源管理器”点击配置，打开ssh config文件
    * 输入远程服务器相关信息，如：

            Host smil-gpu016
            HostName gpu016.scut-smil.cn
            User molangyuan
            # 不写公私钥地址是因为vscode默认会寻找用户ssh目录

<!-- more -->

### 远程服务器ssh配置
#### 对于使用了FreeIPA统一认证的实验室服务器
1. 先运行一条命令使所有服务器添加同一个ssh公钥

        ipa user-mod <你的用户名> --sshpubkey="ssh-rsa 12345abcde= bob@DESCTOP-XXXXXX"
2. 在根目录的.ssh文件夹放置公钥文件（不清楚是否必要）
3. 将公钥写入authorized_keys文件（没有则手动创建）

        cat id-rsa.pub >> authorized_keys

4. 按道理此时从vscode点击服务器就能连接成功！

#### 对于普通实验室服务器
1. 在根目录的.ssh文件夹放置公钥文件
2. 将公钥写入authorized_keys文件（没有则手动创建）

        cat id-rsa.pub >> authorized_keys

3. 按道理此时从vscode点击服务器就能连接成功！


## FreeIPA修改服务器根目录

### 修改命令

    ipa user-mod <你的用户名> --homedir /mnt/cephfs/home/<你的用户名>

ps: 修改之后还需要同步更改其他个人配置

### 个人配置修改 (只需要用一台服务器的信息修改一次便可)
1. 从原来根目录/home/xxx移动个人配置信息到新根目录~下,包括：

        # bash相关配置文件
        cp .profile ~
        cp .bash* ~

        # .cache文件夹，里面有torch模型等信息
        cp -r .cache ~

        # 还有其他等等相关文件