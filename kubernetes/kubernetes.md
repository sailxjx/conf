# kubectl

```bash
kubectl run hello-node --image=your.host/hello-node --port=8080

# 发布 Service
kubectl expose deployment hello-node --type="LoadBalancer"

# 编辑不同 namespace 下的配置
kubectl edit deployment kubernetes-dashboard --namespace=kube-system
```
