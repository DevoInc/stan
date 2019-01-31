#!/bin/bash

# Stop any running containers
docker container stop stanopencpu
docker container rm stanopencpu

# Remove images
docker image rm stanopencpu
docker image rm stanopencpubase
