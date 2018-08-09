---
title: nodejs最新版安装
date: 2018-05-14 01:13:02
categories: 安装指南
tags: 
---

## ubuntu下安装

测试环境：ubuntu16.04

### 更新软件源
    sudo apt-get update
    sudo apt-get install -y python-software-properties software-properties-common
    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
<!-- more -->
### 安装nodejs
    sudo apt-get install nodejs
    sudo apt install nodejs-legacy
    sudo apt install npm

### 更新npm的包镜像源，方便快速下载
    sudo npm config set registry https://registry.npm.taobao.org
    sudo npm config list

### 全局安装n管理器(用于管理nodejs版本)
    sudo npm install n -g

### 安装最新的nodejs（stable版本）
    sudo n stable
    sudo node -v
备注：安装固定版本如8.11.2: sudo n v8.11.2
### 可能遇到的问题
* node版本并没有改变, 解决：

        source .bashrc
    

* sudo n stable一直没反应，解决：

    参考 http://www.goorockey.com/2015/11/01/use-n-to-manage-node/

## windows下安装
暂略