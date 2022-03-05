FROM docker.io/cirss/repro-template

COPY .repro .repro

USER repro

# URLs for packages delivered as CIRSS GitHub releases
ENV CIRSS_RELEASES 'https://github.com/cirss/${1}/releases/download/v${2}/'

# install required repro modules
RUN repro.require blazegraph-service local ${CIRSS_RELEASES}
RUN repro.require blaze 0.2.6 ${CIRSS_RELEASES}

RUN repro.atstart start-blazegraph

CMD  /bin/bash -il
