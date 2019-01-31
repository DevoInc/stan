#!/bin/bash

# Stop any running containers
docker container stop stanopencpu
docker container rm stanopencpu

# Build docker image if it doesn't exist already
[ ! -z $(docker images -q stanopencpubase:latest) ] || docker build -t stanopencpubase -f ./Dockerfile.base . 
[ ! -z $(docker images -q stanopencpu:latest) ] || docker build -t stanopencpu . 

# Run docker container
if [ $(id -u $USER) -eq 1000 ];then
	docker run --name stanopencpu -t -p 8004:8004 -v $(pwd):/home/opencpu/dev:rw -e LOCAL_USER_ID=`id -u $USER` stanopencpu
else
	docker run --name stanopencpu -t -p 8004:8004 -v $(pwd):/home/user/dev:rw -e LOCAL_USER_ID=`id -u $USER` stanopencpu
fi
