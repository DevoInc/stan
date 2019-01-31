#!/bin/bash

docker exec -i -t -u $(id -u $USER) stanopencpu bash -c 'cd;bash'
