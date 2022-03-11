デプロイ

```
$ cd manifests
$ kubectl create namespace eks-sample-app
$ kubectl apply -f eks-sample-deployment.yaml
$ kubectl apply -f eks-sample-service.yaml
```

名前空間内に存在するすべてのリソースを表示する

```
$ kubectl get all -n eks-sample-app
```

デプロイされたすべてのサービスの詳細を表示する

```
$ kubectl -n eks-sample-app describe service eks-sample-linux-service
```

ポッドの詳細を表示する

```
$ kubectl -n eks-sample-app describe pod eks-sample-linux-deployment-65b7669776-m6qxz
```
