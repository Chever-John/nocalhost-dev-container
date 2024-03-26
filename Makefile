GO_VERSION ?= 1.22.1
IMAGE_VERSION ?= latest
IMAGE_REPO_ADDRESS ?= cheverjohn
IMAGE_NAME ?= nocalhost-dev-container
LANG ?= golang

# 使用函数来复用 docker build 命令
define docker_build
@docker build -f golang/Dockerfile --build-arg GO_VERSION=$(GO_VERSION) --platform linux/$(1) -t $(IMAGE_REPO_ADDRESS)/$(IMAGE_NAME):$(LANG)-$(GO_VERSION)-$(IMAGE_VERSION)-$(1) .
endef

# 使用函数来复用 docker push 命令
define docker_push
@docker push $(IMAGE_REPO_ADDRESS)/$(IMAGE_NAME):$(LANG)-$(GO_VERSION)-$(IMAGE_VERSION)-$(1)
endef

.PHONY: image.build.arm64.golang
image.build.arm64.golang:
	$(call docker_build,arm64)

.PHONY: image.push.arm64.golang
image.push.arm64.golang: image.build.arm64.golang
	$(call docker_push,arm64)

.PHONY: image.build.amd64.golang
image.build.amd64.golang:
	$(call docker_build,amd64)

.PHONY: image.push.amd64.golang
image.push.amd64.golang: image.build.amd64.golang
	$(call docker_push,amd64)

.PHONY: image.push.versioned.amd64
image.push.versioned.amd64:
	@docker push $(IMAGE_REPO_ADDRESS)/$(IMAGE_NAME):$(IMAGE_VERSION)
