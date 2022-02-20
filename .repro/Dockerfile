FROM ubuntu:22.04

ENV REPRO_NAME          blazegraph-service

COPY .repro /repro
RUN bash /repro/builders/repro.bootstrap

USER repro

# install module dependencies
ENV PACKAGE_URL_TEMPLATE 'https://github.com/cirss/${module_name}/releases/download/v${package_version}/'
RUN repro.install blaze 0.2.6
RUN repro.install blazegraph-service local

CMD  /bin/bash -il
