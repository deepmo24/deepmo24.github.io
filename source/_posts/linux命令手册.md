---
title: linux命令手册
date: 2018-04-08 00:30:09
categories: 使用指南
tags: linux
---

## 前言
鉴于经常性忘记一些linux命令，这篇博客就用来记录下自己查找过的有用的linux命令。

---手册持续更新---

## linux命令
--------------------------------------------------------------------------------------------------------------------
### df -h
用途：查看磁盘使用情况。

描述：
<!-- more -->
### du -h [文件/目录]
用途：查看文件和目录磁盘使用的空间大小。

描述：

### ls -l|grep "^-"|wc -l
用途：统计文件夹里的文件数。

描述：grep "^d"则是统计子目录数。

### [命令] &
用途：让命令在后台执行。

描述：命令的标准输出还是会显示在终端中，为了不显示命令的标准输出，一个方法是将标准输出重定向到一个文件中，如：command >11.txt &

### jobs
用途：查看后台进程。

描述：

### kill -s 9 pid
用途：杀死进程。

描述：9是一个signal, pid为进程id


### screen (tmux更好用)
PS: 远程ssh连接服务器的福音。当我们从xshell(或其他软件)远程连接服务器时，我们运行的进程会在我们断开这次连接后中断，有了screen，就可以使运行的进程保持运行。

用途：会话恢复(只是功能之一)：只要Screen本身没有终止，在其内部运行的会话都可以恢复。

描述：解决远程连接问题一般用到以下几个命令：
* 创建会话：screen -S [session_name]
* 会话列表：screen -ls
* 分离会话：Ctrl+a+d (即将screen会话与我们本地运行的终端分离，这样子我们关闭了本地终端，screen会话仍然运行)
* 恢复会话：screen -r [session_name] (重新连接本地终端后，恢复到会话中)
* 结束会话：screen -S [session_name] -X quit


### top
用途：查看和监控linux的系统状况。

描述：监控cpu、内存等的使用。

### ps -aux
用途：查看所有用户运行的所有进程情况。

描述：用来查看pid以及进程的使用者等。显示的进程很多，**结合grep命令使用选取匹配特定条件的行。**

### nvidia-smi
用途：查看GPU使用情况。

描述：能显示哪个进程占用多少GPU资源。


### gpu_monitor
用途：查看gpu使用情况以及gpu使用者。

描述：跟nvidia-smi相似但互补，可以查看谁在使用哪一个gpu。


### scp
用途：scp命令用于Linux之间复制文件和目录。

描述：
* 从本地传送到另一台服务器：scp local_file remote_username@remote_ip:remote_folder(文件夹加-r)
* 从远程服务器到本地：scp remote_username@remote_ip:remote_file local_file(folder)(文件夹加-r)

### zip,tar
用途：压缩和打包命令。

描述：
* 压缩：zip target.zip source_file_or_folder
* 解压缩：unzip target.zip
* 打包并压缩：tar -czvf ***.tar.gz source_file_or_folder
* 解压：tar -xzvf ***.tar.gz


### watch [command]
用途：以周期性的方式执行给定的指令，指令输出以全屏方式显示。

描述：
* 参数-n, 指定指令执行的间隔时间（秒）
* 如监控gpu使用情况: watch -n 0 nvidia-smi


### tmux
用途： 终端分屏；ssh远程连接断开仍可保持运行。

描述：

* 查询会话：tmux ls
* 创建会话：tmux new -s session-name
* 断开会话：tmux detach或ctrl + b 再按d
* 连接会话：tmux a -t session-name / tmux a快速连接第一个会话

* 上下分屏：ctrl + b  再按 "
* 左右分屏：ctrl + b  再按 %
* 切换屏幕：ctrl + b  再按"上下左右"箭头
* 关闭一个终端：ctrl + b  再按x
* 上下分屏与左右分屏切换： ctrl + b  再按空格键

### tee file.txt
用途：同时把数据重定向到给定文件和屏幕上。

描述：如用python跑实验，既能在屏幕输出，同时又把输出保存在文件中。


### axel -n 10 [url]
用途：Linux下一个不错的HTTP/ftp高速下载工具。

描述：-n参数：线程数。这个命令比wget下载要快很多。



### lspci | grep -i vga
用途：列出显卡信息。

描述：lspci是列出所有的pci设备, 然后通过grep -i vga挑选出显卡设备。


## linux环境命令
--------------------------------------------------------------------------------------------------------------------

### anaconda解决linux下python2，python3环境共存
用途：使用anaconda使得python2和python3共存。(忽略系统自带的python2)

描述：
1. 下载anaconda(以python3.6为例)并安装(官网下载.sh文件)，此时该linux用户具备python3.6环境
2. conda create --name py2 python=2.7 创建一个python2的虚拟环境
3. source activate py2 激活python2环境，之后操作的python环境都是python2
4. source deactivate py2 退出python2环境，之后操作的python环境是原来的python3


### 查看Cuda和Cudnn的版本(ubuntu)
用途：安装深度学习框架时需要考虑Cuda和Cudnn的版本。

描述：

* 查看cuda版本

```
cat /usr/local/cuda/version.txt
```

* 查看cudnn 版本

```
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
```

### 定期更新Anaconda里面的package版本

用途：更新所有package。像深度学习框架pytorch等package更新速度很快，所以时不时需要升级。

描述：

* 更新所有package
```
conda update --all 
```


* 更新pytorch

```
conda update pytorch torchvision
```

  

