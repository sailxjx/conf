# Random Forest

-   <https://blog.csdn.net/mao_xiao_feng/article/details/52728164>
-   <https://scikit-learn.org/stable/modules/ensemble.html#forest>

通过对随机取样投票的方式，增加了 bias，降低了 variance，整体实现更优的模型

1.从样本集中通过重采样的方式产生n个样本

2.假设样本特征数目为a，对n个样本选择a中的k个特征，用建立决策树的方式获得最佳分割点

3.重复m次，产生m棵决策树

4.多数投票机制来进行预测

（需要注意的一点是，这里m是指循环的次数，n是指样本的数目，n个样本构成训练的样本集，而m次循环中又会产生m个这样的样本集）

分类问题：取众数（与原作者不同的是 sklearn 的实现为取 proba 的平均数）
回归问题：取平均数
