FROM balenalib/raspberry-pi-openjdk:8-jdk

LABEL maintainer="jcustenborder@gmail.com"
ARG INSTALL_PATH="/opt/keycloak"
ARG KEYCLOAK_VERSION="7.0.1"



RUN mkdir -p ${INSTALL_PATH} && \
    cd ${INSTALL_PATH} && \
    curl -sS https://downloads.jboss.org/keycloak/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz -o ${INSTALL_PATH}/keycloak-${KEYCLOAK_VERSION}.tar.gz && \
    tar xzvf --strip-components=1 ${INSTALL_PATH}/keycloak-${KEYCLOAK_VERSION}.tar.gz && \
    rm -rf ${INSTALL_PATH}/keycloak-${KEYCLOAK_VERSION}.tar.gz

WORKDIR ${INSTALL_PATH}