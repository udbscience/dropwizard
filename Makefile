default: docker_build

DOCKER_IMAGE ?= $(shell basename `pwd`)
BUILD_NUMBER ?= `git rev-parse --short HEAD`

.PHONY: docker_build
docker_build:
	@docker build \
	  -f Dockerfile.mvn \
	  -t $(DOCKER_IMAGE):$(BUILD_NUMBER) .

.PHONY: docker_push
docker_push:
	# Push to DockerHub
	docker tag $(DOCKER_IMAGE):$(BUILD_NUMBER) $(DOCKER_IMAGE):latest
	docker push $(DOCKER_IMAGE):$(BUILD_NUMBER)
	docker push $(DOCKER_IMAGE):latest

.PHONY: clean
clean:
	docker rmi $(DOCKER_IMAGE):$(BUILD_NUMBER)

.PHONY: run
run:
	docker run --rm -p 8080:8080 -p 8081:8081 \
	  -dt $(DOCKER_IMAGE):$(BUILD_NUMBER) 
	sleep 5
	open http://localhost:8081/healthcheck
