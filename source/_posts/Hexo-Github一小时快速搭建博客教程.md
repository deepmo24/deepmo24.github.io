---
title: Hexo + Github一小时快速搭建博客教程
author: Langyuan Mo
date: 2018-03-02 16:06:39
mathjax: true
categories: 技术杂谈 
tags:
    - Hexo
    - 博客
---

## 前言
这篇博客教教你如何利用hexo和github pages搭建自己的静态博客，效果如：http://langyuanmo.com

## hexo简介

hexo是一个基于nodejs的博客框架，具体请看 http://hexo.io

简单来说hexo就是一个可以让你不用写一行代码就可以创建你的博客的框架，并且通过修改配置文件就可以对博客进行配置。
<!-- more -->
## Github pages简介

详细介绍在这里https://pages.github.com/

Github pages作用是当你的网站代码放在github仓库上，设置github pages之后，github便会给你提供一个username.github.io的地址直接访问你仓库上的网站（它是个静态网页，如果你不知道静态网站和动态网站的区别可以自行百度一下，可以理解为没有服务端可以交互，如登录注册等功能，只是一个可以浏览内容的网页，不过用来做博客已经足够了）。

## 安装hexo并创建第一个博客

1. 安装nodejs. https://nodejs.org/
2. 安装hexo
    	npm install hexo-cli -g
3. 运行以下命令
		hexo init blog //创建一个名为blog的文件夹并初始化
   	 cd blog 	   //进入该文件夹
		npm install    //安装依赖包
        hexo server    //本地运行hexo服务端，简短命令 hexo s也可以
4. 打开浏览器并输入地址 http://localhost:4000 ，你就可以看到用hexo创建的默认博客界面了，这里hexo默认端口为4000，如果打不开可能是你的4000端口被占用，重新运行命令并指定端口4001
		hexo sever -p 4001
	到这一步你就可以在本地看到你的博客了
    
## 部署到github pages上

1. 在Github上创建一个仓库，并且仓库名为[username].github.io （[username]指的是你的github用户名，仓库名不能叫别的）
2. 安装部署git的依赖包，在blog文件夹下，运行命令
		npm install hexo-deployer-git --save
3. 打开blog文件夹下的_config.yml，找到deploy配置，设置部署到的github仓库地址，如：
		deploy:
        	type: git //冒号后面有个空格，不加空格貌似识别不出来，是个坑，下面也一样冒号后要加空格
  		  repo: https://github.com/jackie-bryant/jackie-bryant.github.io.git //这里更改为你的仓库地址
        	branch: [master]
4. 运行以下命令生成待部署的博客页面
		hexo generate //或hexo g
5. 运行以下命令部署博客
		hexo deploy //你也可以把第3第4条命令合在一起，hexo g -d，意思就是生成完后直接发布
6. 检查结果，此时你的生成的博客网页文件已经被上传到了github的[username.github.io]仓库下了
7. 用浏览器打开网址 [username].github.io，看是否能够成功打开

## 小结

至此你已经可以简单地利用hexo创建自己的博客然后部署到github上，hexo的博客都是用markdown写的，每一次在本地写完博客后都需要在本地生成页面并且部署（上传）到github上，如何用hexo写博客请参考官方文档或者百度。

如果你希望有自己的域名并且如何更好地使用hexo，请继续看以下教程。

## 将hexo文件上传到github仓库

细心的人会注意到，我们部署到github仓库上的文件跟本地的文件会不同，实际上我们只是把本地的.deploy_git文件里面的内容上传到github，而并没有上传如配置文件等hexo文件，为了方便起见我们可以将我们的hexo文件也上传到github上，否则我们可能换了个电脑就没有这些文件，那样没办法更新博客并且发布了。

1. 在刚刚的blog文件夹下运行
		git init //在当前文件夹下初始化git
		git checkout -b hexo //创建hexo分支并切换到hexo分支
        git remote add origin https://github.com/jackie-bryant/jackie-bryant.github.io.git //记得替换你的地址
        git add .
        git commit -m "update hexo"
        git push origin hexo
2. 现在你在[username].github.io的仓库下会看到多了一个hexo分支，保存了我们的hexo文件

3. 为了避免以后误操作（忘记在本地切换到hexo分支），我们最好将hexo设置为默认分支，在仓库的Setting->Branchs->Default branch,选择hexo分支，然后update

## 使用自己的域名

拥有自己的域名话，就可以直接用自己的域名访问而不是github.io这样的后缀的

1. 首先你需要购买一个自己的域名，我自己的是在阿里云上购买的，com国际域名60元一年，不过阿里云需要实名认证

2. 设置域名解析，配置以下三项：
		主机记录     记录类型           记录值
		@              A             192.30.252.153
		@              A             192.30.252.154
		www          CNAME           username.github.io.
  用你自己的 Github 用户名替换 username，注意io后面有个点
3. 在blog文件夹下的source文件夹里面，创建一个CNAME文件（没有后缀）
4. 打开CNAME，写入自己的顶级域名，如example.com（没有www.），比如我的就是 langyuanmo.com
5. 回到blog目录下，运行
		hexo g -d //生成博客并部署
6. 然后你就会看到你的github仓库的master分支下（也就是部署的博客），根目录会多了一个CNAME文件，接着你用浏览器打开你的域名，应该就可以访问了

PS: 有些人可能会看到Setting的Github Pages部分有一个Custom domain,那个确实可以设置自己的域名，设置完之后它也会在你的master上创建一个CNAME文件，但是这样的做法每次我们部署博客的时候，新上传的博客文件会覆盖整个master分支，导致这个CNAME文件丢失，因此我们将CNAME文件放在source文件夹下，每次部署的时候都会重新上传一个CNAME文件

## 更换默认hexo主题
	
    
这里只是提一下，有兴趣可以自己找一些hexo主题

如使用比较广泛的next主题http://theme-next.iissnan.com，当前我的博客使用的就是这个主题

知乎【有哪些好看的 Hexo 主题】：https://www.zhihu.com/question/24422335
   
## 安装各种hexo插件

这里也提一下，就不详细展开了，比较重用的有统计分析插件，sitemap，评论插件等等，另外如果嫌用原生的hexo写博客比较麻烦，推荐一个hexo admin插件。

## 安装插件跳坑指南
* 为NexT主题添加文章阅读量统计功能的[教程](https://notes.wanghao.work/2015-10-21-%E4%B8%BANexT%E4%B8%BB%E9%A2%98%E6%B7%BB%E5%8A%A0%E6%96%87%E7%AB%A0%E9%98%85%E8%AF%BB%E9%87%8F%E7%BB%9F%E8%AE%A1%E5%8A%9F%E8%83%BD.html#%E9%85%8D%E7%BD%AELeanCloud)
* 使hexo博客支持latex公式的[教程](http://blog.cofess.com/2017/09/06/how-to-use-mathjax-to-render-latex-mathematical-formulas-in-hexo.html)
**(注：next主题集成了mathjax。在主题配置文件定位到mathjax，false改为true之后就不用做教程里“加载css”的步骤了。|测试：$x^2$|)，有点小bug，把原来的字母也渲染出来了**


## 总结

到此为止基本你能够学会用hexo和github搭建拥有自己域名的博客了，hexo还有其他一些玩法，以及如何配置它的配置文件，这些就需要读者自己去摸索了。

>博客取材于 http://jinjinlin.com/2017/08/26/Hexo-Github%E5%BF%AB%E9%80%9F%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2%E6%95%99%E7%A8%8B/ 如有冒犯，请联系我将本文下架。

