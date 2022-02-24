FROM ubuntu:22.04

ENV REPRO_NAME  blazegraph-service

COPY .repro-builder .repro-builder
RUN bash .repro-builder/bootstrap

USER repro

# define URL template for packages delivered as CIRSS GitHub releases
ENV CIRSS_RELEASES 'https://github.com/cirss/${1}/releases/download/v${2}/'

# install required repro modules
RUN repro.install blaze 0.2.6 ${CIRSS_RELEASES}
RUN repro.install blazegraph-service local ${CIRSS_RELEASES}

RUN repro.atstart start-blazegraph

CMD  /bin/bash -il
