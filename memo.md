## kubectl について

- K8s では、クラスタの操作は全て Kubernetes Master の API を介して行われる。
- kubectl が Kubenetes Master と通信する際には、接続先のサーバ情報や認証情報が必要になる。
- kubectl は kubeconfig（デフォルトでは~/kube/config）に書かれている情報を使用して接続を行う。
- kubectl は Context を切り替えることで、複数の環境を複数の権限で操作できるように設計されている。
- context はクラスタ情報、ユーザー名。ネームスペースを組み合わせたもの。
- cluster と user のペアで接続先の Kubernetes のクラスタが決まる。

```
$ cd step3
<!-- configファイルの生成 -->
$ aws eks update-kubeconfig --region リージョン名 --name クラスター名
$ aws eks update-kubeconfig --region ap-northeast-1 --name stage-terraform-aws-sample

<!-- 現在のコンテキスト -->
$ kubectl config current-context

<!-- コンテキスト一覧 -->
$ kubectl config get-contexts

<!-- コンテキスト切り替え -->
$ kubectl config use-context arn:aws:eks:ap-northeast-1:891282500588:cluster/stage-terraform-aws-sample

<!-- クラスター内リソースを確認 -->
$ kubectl get all -A
```

## Kubenetes 構成

- クラスター
  - コンテナ化されたアプリケーションを実行するノードの集合体
  - クラスター内には少なくとも１つ以上のマスターノードと１つまたは複数のワーカーノードが存在する
- ノード
  - Kubernetes のワーカーマシン（アプリケーションを実行するマシン）
- ワーカーノード
  - コンテナの実行ホスト
- マスターノード
  - ワーカーノードを管理するノード
- Pod
  - Kubenetes で実行できるアプリケーションの最小単位
