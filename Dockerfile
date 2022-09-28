FROM cirss/repro-parent:latest

COPY exports /repro/exports

ADD ${REPRO_DIST}/boot-setup /repro/dist/
RUN bash /repro/dist/boot-setup

USER repro

# install required repro modules
RUN repro.require blazegraph-service exports
#RUN repro.require blaze 0.2.6 ${CIRSS_RELEASE}

CMD  /bin/bash -il
