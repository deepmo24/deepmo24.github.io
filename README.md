
# Hexo个人博客

## 分支介绍

1. master分支是hexo博客部署分支
2. hexo分支是个人配置文件分支


## 发布文章
1. 新建文章

        hexo new <文章title>
2. 编辑文章：直接修改source/_post/<文章title>文件
3. 发布文章

        hexo clean
        hexo d -g

## 更改个人配置

1. 修改`_config.yml`文件
2. 更改网页主题相关配置，修改`themes\hexo-theme-next\_config.yml`文件

ps: 修改完文件后记得git一下，把配置更改信息push到远程仓库