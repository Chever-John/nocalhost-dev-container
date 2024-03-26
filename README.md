# Nocalhost Dev Container

这个项目主要是为了给 Nocalhost 提供不同语言的开发环境容器而创建的。

此处我给 Golang 1.22.1 版本的开发环境。

在 dev-container 项目的根目录下，先修改完你想要的 Dockerfile 文件后，运行如下命令，可以创建出你自己的 Golang 开发环境容器。

```sh
make image.push.amd64.golang GO_VERSION=1.22.1
```

这边还有三个参数可以选择：

```sh
GO_VERSION ?= 1.22.1
IMAGE_VERSION ?= v1.1.1
IMAGE_REPO_ADDRESS ?= cheverjohn
IMAGE_NAME ?= nocalhost-dev-container-go
```

GO_VERSION：是你要创建的 Golang 环境的版本号。

IMAGE_VERSION：是该容器镜像的版本。

IMAGE_REPO_ADDRESS：是该镜像为了 push 到哪里，此处默认了我的个人账号在 dockerhub 的仓库地址。

IMAGE_NAME：镜像的名字不多解释。



List of dev containers:

```
nocalhost-docker.pkg.coding.net/nocalhost/dev-images/node:latest
nocalhost-docker.pkg.coding.net/nocalhost/dev-images/node:14

nocalhost-docker.pkg.coding.net/nocalhost/dev-images/golang:latest
nocalhost-docker.pkg.coding.net/nocalhost/dev-images/golang:1.16

nocalhost-docker.pkg.coding.net/nocalhost/dev-images/python:latest
nocalhost-docker.pkg.coding.net/nocalhost/dev-images/python:3.9

nocalhost-docker.pkg.coding.net/nocalhost/dev-images/java:latest
nocalhost-docker.pkg.coding.net/nocalhost/dev-images/java:11

nocalhost-docker.pkg.coding.net/nocalhost/dev-images/ruby:latest
nocalhost-docker.pkg.coding.net/nocalhost/dev-images/ruby:3.0
```

## TODO

1. 自己本地的 gitlab 的 CI 没有做。
