FROM stanopencpubase 

# Install vim to be able to edit things inside the docker shell
RUN apt -yq install vim

# Install devtools
RUN R -e 'install.packages("devtools")'

ADD . /home/opencpu/dev

# Install stanopencpu dependencies
RUN R -e 'devtools::install_deps("/home/opencpu/dev")'

# Install stanopencpu 
RUN R CMD INSTALL /home/opencpu/dev 

# setup rstudio's pandoc installation for global use so that OpenCPU/rmarkdown can also use it
RUN ln -s /usr/lib/rstudio-server/bin/pandoc/pandoc /usr/local/bin

# This is the first command that will be executed after entrypoint.sh, copied from the opencpu/rstudio image
# TODO: why is this needed? the original CMD command from opencpu/rstudio is lost somewhere
CMD service cron start && /usr/lib/rstudio-server/bin/rserver && apachectl -DFOREGROUND
