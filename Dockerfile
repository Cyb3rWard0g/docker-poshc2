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

# **** Set ARG Values ****
ARG POSHC2_HOME=/opt/PoshC2

# ******* POSHC2 ENV ******
ENV POSHC2_HOME ${POSHC2_HOME}

# Install dependencies
RUN apt-get update --fix-missing \
  && apt-get -qy full-upgrade \
  && apt-get install -y --no-install-recommends wget nano git \
  && wget http://security.debian.org/debian-security/pool/updates/main/i/icu/libicu63_63.1-6+deb10u1_amd64.deb -O libicu63.deb \
  && dpkg -i libicu63.deb \
  && apt-get -qy clean autoremove \
  && rm -rf /var/lib/apt/lists/* \
  # Clone PoshC2 Repository
  && git clone https://github.com/nettitude/PoshC2 ${POSHC2_HOME} \
  && ${POSHC2_HOME}/Install.sh

COPY scripts/poshc2-entrypoint.sh /opt/

RUN chmod +x /opt/poshc2-entrypoint.sh

WORKDIR ${POSHC2_HOME}
ENTRYPOINT ["/opt/poshc2-entrypoint.sh"]
CMD ["/bin/bash"]