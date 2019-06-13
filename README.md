# CoreOSを活用したVagrant環境

## 概要

Vagrant上でDockerの検証可能なサンプル環境です。<br>
Docker利用に特化するためにOSは[CoreOS](https://coreos.com/)を採用しています。

## CoreOSとは

CoreOSとはLinux Distributionの一つでDockerなどのコンテナ利用に特化したLinux OSです。

## 設定パラメータ

Vagrantfileファイル内の以下の変数を変更することでインスタンスの設定変更が可能です。

| 項目 | 変数名 | 説明 |
| :---- | :---- | :---- |
| Workerインスタンス数 | $worker_instance_num | 起動するWorkerインスタンスの数 |
| メモリー | $vm_memory | インスタンスで利用可能なメモリー数 |
| CPU | $vm_cpu | インスタンスで利用可能なCPU数 |

## セットアップ方法

```
$ vagrant up
```

## docker-composeのインストール

CoreOSではデフォルトで docker-compose がインストールされていないため、vagrantの **config.vm.provision :shell** を利用して、プロビジョニングのタイミングで bin/setup.sh を実行し、docker-compose をインストールしています。<br>
スクリプトの処理では[こちら](http://docs.docker.jp/compose/install.html#id4)を参考に docker-composeコンテナとしてインストールを行なっています。

## 参考

1. Open source, containers, and Kubernetes _ CoreOS, https://coreos.com/, Online; accessed 11-June-2019.
2. Docker Compose のインストール — Docker-docs-ja 17.06.Beta ドキュメント, http://docs.docker.jp/compose/install.html#id4, Online; accessed 12-June-2019.
