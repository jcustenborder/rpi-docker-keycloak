#!/usr/bin/env bash

if [ -n "${KEYCLOAK_ADMIN_USER}" ]; then
  echo "Creating user ${KEYCLOAK_ADMIN_USER}"
  /opt/keycloak/bin/add-user-keycloak.sh --user "${KEYCLOAK_ADMIN_USER}" --password "${KEYCLOAK_ADMIN_PASS}"
fi

/opt/keycloak/bin/standalone.sh -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0 "$@"