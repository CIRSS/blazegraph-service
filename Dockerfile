FROM docker.io/cirss/repro-template

COPY .repro .repro

USER repro

# install required repro modules
RUN repro.require blazegraph-service exported
RUN repro.require blaze 0.2.6 ${CIRSS_RELEASE}

RUN repro.atstart blazegraph-service.start

CMD  /bin/bash -il
