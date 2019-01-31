
## This project is an experiment and it's not production ready yet.

### stan-opencpu

This folder contains a small R package that can be installed inside an OpenCPU server.

The package is an R service that is exposed as a REST API automatically by OpenCPU

Once OpenCPU is running the service can be accessed by making a POST call to the following URL:
http://localhost:8004/ocpu/library/stanopencpu/R/render

and passing a "dataframe" parameter with the following example format:
[["eventdate","cpuUsr"],[1543420833037,23.221],[1543420834202,0.025]]

It will then proceed to render an internal R markdown notebook by using the passed data and
expose it as an html that will be accessible by a generated URL of this kind:
http://localhost:8004/ocpu/tmp/x0e940fd91cd23f/files/output.html

### Running OpenCPU + stan service with Docker

Option 1: using helpers 
inside the opencpu directory:
to launch the opencpu server: ./launch.sh
to open a shell inside the server: ./shell.sh
to reinstall stanopencpu after changes are made (inside the opencpu shell): R CMD INSTALL /home/opencpu/dev 

Option 2:

a Dockerfile that installs OpenCPU and Rstudio is included in this folder, the Dockerfile
will also install the stan-opencpu service so that it is available upon running the docker container 
with the OpenCPU server.

To build the docker image:
docker build -t stanopencpu .

To run the a docker container created from the previous image use the command below. 
While developing it's useful to map the directory where your source code resides into a directory inside 
the docker container. To do this change the "-v /your/dev/folter:root/dev" part of the command 
to point to your development directory.

docker run --name stanopencpu -t -p 8004:8004 -v /your/dev/folder:/root/dev stanopencpu

To open a shell inside the container:

docker exec -i -t stanopencpu /bin/bash


### Additional info:

How to deploy an app inside OpenCPU
https://www.opencpu.org/posts/scoring-engine/
OpenCPU server instructions
https://opencpu.github.io/server-manual/opencpu-server.pdf
Download OpenCPU, including docker image
https://www.opencpu.org/download.html
OpenCPU JSON RPC
https://cran.r-project.org/web/packages/jsonlite/vignettes/json-opencpu.pdf
