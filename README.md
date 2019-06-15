# CoreOSを活用したVagrant環境

## 概要

Vagrant上でDockerの検証を可能なサンプル環境です。<br>
Docker利用に特化するためにOSは[CoreOS](https://coreos.com/)を採用しています。<br>
また、複数サーバーからなるマルチホストのDocker環境を管理するためのGUIツールとして[Rancher](https://rancher.com/what-is-rancher/overview)を利用できるようにしています。

## CoreOSとは

CoreOSとはLinux Distributionの一つでDockerなどのコンテナ利用に特化したLinux OSです。

## Rancherとは

Rancherとは、マルチホストのDocker環境を管理するフレームワークの一つであるKubenetesクラスタを管理できるGUIツールです。


## 設定パラメータ

Vagrantfileファイル内の以下の変数を変更することでインスタンスの設定変更が可能です。

| 項目 | 変数名 | 説明 |
| :---- | :---- | :---- |
| Masterノードのメモリー | $master_vm_memory | Masterノードで利用可能なメモリー数 |
| MasterノードのCPU | $master_vm_cpu | Masterノードで利用可能なCPU数 |
| Workerノード数 | $worker_node_num | 起動するWorkerノードの数 |
| Workerノードのメモリー | $worker_vm_memory | Workerノードで利用可能なメモリー数 |
| WorkerノードのCPU | $worker_vm_cpu | Workerノードで利用可能なCPU数 |

## セットアップ方法

```
$ vagrant up
```

## Rancherの利用方法

セットアップ完了後以下のURLにアクセスすると Rancherを利用できます。

* https://localhost:8443/login または https://172.16.1.170:8443/login

### ログイン画面のイメージ

![Rancherログイン画面](./doc/img/rancher-login.png)



## docker-composeのインストール

CoreOSではデフォルトで docker-compose がインストールされていないため、vagrantの **config.vm.provision :shell** を利用して、プロビジョニングのタイミングで bin/setup.sh を実行し、docker-compose をインストールしています。<br>
スクリプトの処理では[こちら](http://docs.docker.jp/compose/install.html#id4)を参考に docker-composeコンテナとしてインストールを行なっています。

## 参考

1. Open source, containers, and Kubernetes _ CoreOS, https://coreos.com/, Online; accessed 11-June-2019.
2. Docker Compose のインストール — Docker-docs-ja 17.06.Beta ドキュメント, http://docs.docker.jp/compose/install.html#id4, Online; accessed 12-June-2019.
3. Container Orchestration _ Kubernetes Management _ Rancher, https://rancher.com/, Online; accessed 15-June-2019.
