---
title: Representation Learning
tags:
---


# 表示学习

## 前言
这篇博客记录了Ian Goodfellow (GAN发明人) , Yoshua Bengio 和 Aaron Courville写的Deep Learning 第15章 [representation learning](http://www.deeplearningbook.org/contents/representation.html)的笔记。

## 笔记

1. 很多任务完成的难易程度依赖于信息表示。例子：对于除法任务210/6，罗马数字表示：CCX/VI；阿拉伯数字表示：210/6。

2. 通常来说，良好的表示(representation)就是使后续学习任务更容易的表示。 表示的选择通常取决于后续学习任务的选择。

3. 大多数表示学习的问题都会面临在尽可能多地保留输入信息和获得好的特征(属性)之间进行折中。

4. 表示学习提供了一个方式去进行unsupervised and semi-supervised learning，使得从unlabeled training data中学习到的表示可以解决supervised learning的任务。

### 15.1 Greedy Layer-Wise Unsupervised Pretraining
它也可以被简单称作unsupervised pretraining。

1. Greedy: 贪婪算法，独立地优化每一步，而不是一起优化所有步。
2. Layer-Wise：网络的每一层都用一个unsupervised representation learningalgorithm训练。
3. Pretraining: 它只是在用joint training algorithm对所有层进行fine-tune之前的第一步。

#### 15.1.1 When and Why Does Unsupervised Pretraining Work?
1. 有些任务上Unsupervised pretraining是负作用的。

2. Unsupervised pretraining结合了两种不同的ideas。 首先，它利用了深层神经网络初始参数的选择可以对模型产生显著的的regularizing effect（在较小的程度上它可以改进优化）。 其次，它利用了更general的idea，即学习输入分布可以帮助学习从输入到输出的映射。

3. Unsupervised pretraining能够减少模型在estimatin阶段的variance，即减少overfitting。

4. Unsupervised pretraining提供regularization，但和训练是单独的两个阶段，这是一个缺点。对比其他的正则策略(relu,drop out,batch normalizatin等)允许用户在训练时通过调整一个超参数来控制正则的强度。不过通过设置一个与Unsupervised cost相关的系数，可以决定unsupervised objective将有多强烈地regularize监督模型。

5. **今天，Unsupervised pretraining在很大程度上已被放弃，除了在自然语言处理领域，单词作为一个热点向量的自然表示没有传达相似性信息，并且可以使用非常大的未标记集。** 使用drop out等方法已经在实验证明在中等数据集上表现优于Unsupervised pretraining。今天,pretraining的概念已经被广泛地用于Supervised pretraining，例如在imageNet上训练好的监督模型，我们拿来fine tune自己的模型。

### 15.2 Transfer Learning and Domain Adaptation

**Transfer learning** and **domain adaptation** refer to the situation where what has beenlearned in one setting (e.g., distributionP1) is exploited to improve generalizationin another setting (say, distributionP2).

1. 在迁移学习中，学习器必须能够在两个或多个任务上执行。P1的特征也是P2需要捕获的特征，再加上学习P1和P2之间的关系，使P2的任务更容易完成。例子：P1:猫和狗的视觉分类，P2:蚂蚁和黄蜂的视觉分类。（许多视觉类别共享边缘和视觉形状的低级概念，几何变化的影响，灯光变化等等）

2. 有时候，不同任务之间共享的内容不是输入的语义，而是输出的语义。例子：语音识别，前面的layer可能是不同说话者的特征，而最后面的layer才是抽象出的共同特征。

3. 在domain adaptation的案例中，每个设置的任务（和最佳的input-to-output映射）是不变的，但是输入的分布略有不同。例子：情感分析任务，positive或者negative。输入域来自电影评论，也有来自商品评论等。

4. 在所有这些案例中，representation learning的核心思想是相同的表示在两种设置中都可能有用。

5. 迁移学习和领域适应可以通过representation learning实现。

6. **one-shot learning**和**zero-shot learning**是迁移学习的两种极端形式。

7. **one-shot learning**是在迁移学习的第二个阶段只需要一个labeled example，推测test examples的label。

8. **zero-shot learning**能够成为可能，只有当额外的信息在训练时已经被挖掘到。例子：机器翻译，从一种语言X翻译到另一种语言Y,即使我们没有labeled example,对于语言X的单词A,我们可以generalize并猜测词A的翻译，因为我们已经学习了语言X中的词的distributed representation和语言Y中的词的distributed representation，然后通过训练例子创建了与两个空间相关的由两种语言的配对句子组成的link（可能是双向的）。 
### 15.3 Semi-Supervised Disentangling of Causal Factors
暂无

### 15.4 Distributed Representation
