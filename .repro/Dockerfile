FROM ubuntu:22.04

ENV REPRO_NAME      blazegraph-service
ENV REPRO_MNT       /mnt/${REPRO_NAME}
ENV REPRO_USER      repro
ENV REPRO_UID       1000
ENV REPRO_GID       1000
ENV HOME            /home/${REPRO_USER}
ENV BASHRC          ${HOME}/.bashrc
ENV LOCAL_PACKAGE   ${HOME}/package
ENV MODULES_DIR     ${HOME}/modules/

RUN apt-get -y update &&                                                        \
    apt -y install apt-utils wget makepasswd make git sudo man less file tree
    
RUN echo '***** Add the REPRO user and group *****'                             \
    && groupadd ${REPRO_USER} --gid ${REPRO_GID}                                \
    && useradd ${REPRO_USER} --uid ${REPRO_UID} --gid ${REPRO_GID}              \
        --shell /bin/bash                                                       \
        --create-home                                                           \
        -p `echo repro | makepasswd --crypt-md5 --clearfrom - | cut -b8-`       \
    && echo "${REPRO_USER} ALL=(ALL) NOPASSWD: ALL"                             \
            > /etc/sudoers.d/${REPRO_USER}                                      \
    && chmod 0440 /etc/sudoers.d/repro


USER ${REPRO_USER}
WORKDIR $HOME

# install scripts for building and configuring the REPRO
ENV REPRO_SCRIPTS_DIR ${HOME}/scripts
COPY --chown=repro:repro .repro/scripts ${REPRO_SCRIPTS_DIR}
RUN chmod a+rx ${REPRO_SCRIPTS_DIR}/*.sh

# copy local package into the REPRO
COPY --chown=repro:repro package ${LOCAL_PACKAGE}

# install module dependencies
ENV PACKAGE_URL_TEMPLATE 'https://github.com/cirss/${module_name}/releases/download/v${package_version}/'
RUN scripts/install-module.sh blaze 0.2.6
RUN scripts/install-module.sh blazegraph-service local

RUN echo "export PATH=${REPRO_MNT}/binaries:`cat ~/.bundle_path`$PATH" >> ${BASHRC}
RUN echo "export IN_RUNNING_REPRO=${REPRO_NAME}" >> ${BASHRC}
RUN echo "cd ${REPRO_MNT}" >> ${BASHRC}
RUN echo "start_blazegraph.sh" >> ${BASHRC}

CMD  /bin/bash -il
