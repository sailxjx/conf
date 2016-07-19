# kubectl

```bash
kubectl run hello-node --image=your.host/hello-node:v1 --port=8080  # 需要 tag

# 编辑不同 namespace 下的配置
kubectl edit deployment kubernetes-dashboard --namespace=kube-system
```
