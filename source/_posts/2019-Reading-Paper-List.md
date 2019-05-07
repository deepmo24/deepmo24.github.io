---
title: 2019 Reading Paper List
date: 2019-04-24 22:24:08
categories: 学习笔记
tags: 
description: Reading papers in 2019.
---


## 前言
这篇博客记录下自己2019年看的paper。一是给自己留个记录，便于以后回忆翻阅。二是通过给paper写一段简短的综述，练习自己的英语写作。

---Paper不断更新---


## Paper List

### Rethinking Feature Distribution for Loss Functions in Image Classification
**From:** CVPR2018  
**Address:** http://openaccess.thecvf.com/content_cvpr_2018/CameraReady/3524.pdf  
**Key words:** Image Classification; feature representation;  
**Content:**   
Softmax cross-entropy loss is widely used in recent classification tasks. The usual procedure is as follows. The extracted deep feature x from CNN is put into a linear layer(f(x)) and a softmax function to get the final output, then this output is used to compute the cross-entropy loss. However, the relationship between f(x) and the probability distribution of the training feature space is vague.   
This paper proposes a Gaussian Mixture loss under the assumption that the learned features of the training set follow a Gaussian Mixture distribution. So the posterior probability can be computed in a new way instead of computing thorough a linear layer and softmax operation.