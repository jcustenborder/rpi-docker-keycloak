FROM balenalib/raspberry-pi-openjdk:8-jdk

LABEL maintainer="jcustenborder@gmail.com"
ARG INSTALL_PATH="/opt/keycloak"
ARG KEYCLOAK_VERSION="7.0.1"

RUN mkdir -p ${INSTALL_PATH} && \
    cd ${INSTALL_PATH} && \
    curl -sS https://downloads.jboss.org/keycloak/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz -o ${INSTALL_PATH}/keycloak-${KEYCLOAK_VERSION}.tar.gz && \
    tar xzvf ${INSTALL_PATH}/keycloak-${KEYCLOAK_VERSION}.tar.gz --strip-components=1  && \
    rm -rf ${INSTALL_PATH}/keycloak-${KEYCLOAK_VERSION}.tar.gz
ADD ./keycloak-entrypoint.sh ${INSTALL_PATH}/
WORKDIR ${INSTALL_PATH}

ENTRYPOINT /opt/keycloak/keycloak-entrypoint.sh -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0