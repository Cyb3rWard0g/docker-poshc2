# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

# Referneces:
# https://poshc2.readthedocs.io/en/latest/install_and_setup/docker.html
# https://github.com/nettitude/PoshC2/blob/master/Dockerfile

FROM phusion/baseimage:0.11
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Dockerfile PoshC2."

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV TERM="xterm"

# ******* POSHC2 ******
ENV POSHC2_HOME /opt/PoshC2

# Install dependencies
RUN apt-get update --fix-missing \
  && apt-get -qy full-upgrade \
  && apt-get install -y --no-install-recommends wget nano git \
  && apt-get -qy clean autoremove \
  && rm -rf /var/lib/apt/lists/* \
  # Clone PoshC2 Repository
  && git clone https://github.com/nettitude/PoshC2 ${POSHC2_HOME} \
  && ${POSHC2_HOME}/Install.sh

COPY scripts/poshc2-entrypoint.sh ${POSHC2_HOME}/

RUN chmod +x ${POSHC2_HOME}/poshc2-entrypoint.sh

WORKDIR ${POSHC2_HOME}
ENTRYPOINT ["./poshc2-entrypoint.sh"]