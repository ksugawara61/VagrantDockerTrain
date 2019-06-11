# CoreOSを活用したVagrant環境

## CoreOSとは

CoreOSとはLinux Distributionの一つでDockerなどのコンテナ利用に特化したLinux OSです。


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
