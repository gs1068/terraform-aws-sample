## kubectl について

- K8s では、クラスタの操作は全て Kubernetes Master の API を介して行われる。
- kubectl が Kubernetes Master と通信する際には、接続先のサーバ情報や認証情報が必要になる。
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

## Kubernetes 構成

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
  - Kubernetes で実行できるアプリケーションの最小単位
- ワークロード
  - Kubernetes で実行中のアプリケーション
    - ワークロードリソース
      - Deployment(ReplicaSet を管理する)
        1. 新しい ReplicaSet を作成
        2. 新しい ReplicaSet 上でレプリカ数（Pod 数）を徐々に増やす
        3. 古い ReplicaSet 上のレプリカ数(Pod 数)を徐々に減らす
        4. (2,3 を繰り返す)
        5. 古い ReplicaSet はレプリカ数は０で保持する
      - ReplicaSet(Pod を管理する)
        - Pod のレプリカを作成し、指定した数の Pod を維持し続けるリソース
      - StatefulSet
      - DaemonSet
        - ReplicaSet は ReplicaSet の特殊な形
        - ReplicaSet は Kubernetes Node 上で合計で N 個の Pod を Node のリソースの状況に合わせて配置していくが、DeamonSet は各ノードに Pod を一つずつ配置するリソース。
      - Job
      - CronJob

参考資料
https://pages.awscloud.com/rs/112-TZM-766/images/00_AWS%E8%90%BD%E6%B0%B4%E3%81%95%E3%82%93_%E8%B3%87%E6%96%99.pdf
