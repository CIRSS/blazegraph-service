FROM docker.io/cirss/repro-template

COPY exports /repro/exports

USER repro

# install required repro modules
RUN repro.require blazegraph-service exports
RUN repro.require blaze 0.2.6 ${CIRSS_RELEASE}

RUN repro.atstart blazegraph-service.start

CMD  /bin/bash -il
