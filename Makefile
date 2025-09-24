DOCKER_NAME ?= rcore-docker
.PHONY: docker build_docker
	
docker:
	sudo docker run --network host \
	-e HTTP_PROXY=http://127.0.0.1:7897 \
  	-e HTTPS_PROXY=http://127.0.0.1:7897 \
	 --rm -it -v ${PWD}:/mnt -w /mnt ${DOCKER_NAME} bash

build_docker: 
	sudo docker build --network host \
	--build-arg HTTP_PROXY=http://127.0.0.1:7897 \
  	--build-arg HTTPS_PROXY=http://127.0.0.1:7897 \
	 -t ${DOCKER_NAME} .

fmt:
	cd os ; cargo fmt;  cd ..

