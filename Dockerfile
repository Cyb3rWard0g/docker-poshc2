# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

# Referneces:
# https://poshc2.readthedocs.io/en/latest/install_and_setup/docker.html
# https://github.com/nettitude/PoshC2/blob/master/Dockerfile

FROM phusion/baseimage:0.11
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Dockerfile PoshC2."

USER root

# **** Set ARG Values ****
ARG POSHC2_USER=poshc2
ARG POSHC2_UID=510
ARG POSHC2_GID=510
ARG POSHC2_HOME=/opt/PoshC2

ENV DEBIAN_FRONTEND noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# ********** POSHC2 User ******
ENV USER ${POSHC2_USER}
ENV POSHC2_UID ${POSHC2_UID}
ENV HOME /home/${POSHC2_USER}
ENV POSHC2_GID $POSHC2_GID
ENV POSHC2_HOME ${POSHC2_HOME}
ENV PATH ${HOME}/.local/bin:$PATH
ENV PYTHONPATH ${PYTHONPATH}:${POSHC2_HOME}

  # ********** Installing Initial Requirements ***************
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends wget sudo nano \
  # ********** Adding PoshC2 User **************
  && echo "auth requisite pam_deny.so" >> /etc/pam.d/su \
  # remove the sudo rights for all users with admin privileges or in admin group
  && sed -i.bak -e 's/^%admin/#%admin/' /etc/sudoers \
  && sed -i.bak -e 's/^%sudo/#%sudo/' /etc/sudoers \
  && groupadd -g ${POSHC2_GID} ${POSHC2_USER} \
  && useradd -m -s /bin/bash -u ${POSHC2_UID} -g ${POSHC2_GID} ${POSHC2_USER} \
  # Clone PoshC2 Repository
  && git clone https://github.com/nettitude/PoshC2 ${POSHC2_HOME} \
  # Install PoshC2
  && ${POSHC2_HOME}/Install.sh \
  # Change ownership of PoshC2 home
  && chown -R ${USER}:${USER} ${HOME} ${POSHC2_HOME}

WORKDIR ${POSHC2_HOME}

USER ${USER}