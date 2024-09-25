# Add the rocker/verse Docker image for R 4.4.1

FROM rocker/verse:4.4.1

# Add our files to container

ADD test_quart.qmd /home/rstudio/
ADD _extensions/ /home/rstudio/_extensions/
ADD bibliography.bib /home/rstudio/

# Add appropriate versions of required R packages to container

RUN R -e "install.packages('devtools')"

RUN R -e "require(devtools)"

# tidyverse is included in rockerverse image

RUN R -e "devtools::install_version('MASS', version = '7.3-61', dependencies = T)"
RUN R -e "devtools::install_version('qwraps2', version = '0.6.0', dependencies = T)"
