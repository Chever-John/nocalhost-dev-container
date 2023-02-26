GO_VERSION ?= 1.19
IMAGE_VERSION ?= new
IMAGE_REPO_ADDRESS ?= harbor.dev-eur.sheincorp.cn/nocalhost/dev-images
IMAGE_NAME ?= golang

.PHONY: image.build.arm.golang
image.build.arm.golang:
	@docker build -f golang/Dockerfile --build-arg GO_VERSION=${GO_VERSION} --platform linux/arm64 -t $(IMAGE_REPO_ADDRESS)/$(IMAGE_NAME):$(IMAGE_VERSION) .

.PHONY: image.push.arm.golang
image.push.arm.golang: image.build.arm.golang
	@docker push $(IMAGE_REPO_ADDRESS)/golang:$(GO_VERSION)

.PHONY: image.build.amd.golang
image.build.amd.golang:
	@docker build -f golang/Dockerfile --build-arg GO_VERSION=${GO_VERSION} --platform linux/amd64 -t $(IMAGE_REPO_ADDRESS)/golang:$(IMAGE_VERSION) .

.PHONY: image.push.amd.golang
image.push.amd.golang: image.build.amd.golang
	@docker push $(IMAGE_REPO_ADDRESS)/golang:$(IMAGE_VERSION)

.PHONY: image.just-push.amd.golang
image.just-push.amd.golang: 
	@docker push $(IMAGE_REPO_ADDRESS)/golang:$(IMAGE_VERSION)