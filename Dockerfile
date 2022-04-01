FROM cirss/repro-parent:latest

COPY exports /repro/exports

ADD ${REPRO_DIST}/setup-boot /repro/dist/
RUN bash /repro/dist/setup-boot

USER repro

# install required repro modules
RUN repro.require blazegraph-service exports
RUN repro.require blaze 0.2.6 ${CIRSS_RELEASE}

RUN repro.atstart blazegraph-service.start

CMD  /bin/bash -il
