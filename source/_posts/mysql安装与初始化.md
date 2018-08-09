---
title: mysql安装与初始化
date: 2018-05-17 21:42:51
categories: 安装指南
tags:
---

## ubuntu下安装

测试环境：ubuntu16.04

### 使用如下指令安装
    sudo apt-get install mysql-server
    sudo apt install mysql-client
    sudo apt install libmysqlclient-dev
<!-- more -->

### 验证是否安装成功
    sudo netstat -tap | grep mysql

### 初始化root密码
    mysqladmin -u root password "newpassword"

### 登录
    mysql -u root -p

### 设置mysql允许远程访问
编辑文件/etc/mysql/mysql.conf.d/mysqld.cnf:

    sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf

注释掉bind-address = 127.0.0.1 这一行

### 重启mysql服务
    service mysql restart

### 让mysql支持中文
查看数据库编码：

    show variables like '%char%';


修改mysql的配置文件，让mysql默认编码为utf8。

配置文件在/etc/mysql/my.cnf，可以直接加在my.cnf中，当然为了方便移植可复用，也可以如下写在独立的配置文件中。

在my.cnf中include了 conf.d/ 下面所有的*.cnf文件，所以可以conf.d/下面加上一个我们自己的配置文件wy_sql.cnf。

添加内容：

    [mysqld]
    character-set-server=utf8
    [client]
    default-character-set=utf8

重启mysql即生效。


## windows下安装
暂略


