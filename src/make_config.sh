#!/bin/sh

set -e
: ${CLUSTER_ENV_VERSION?"Must set CLUSTER_LANDING_PAGE_ENV_VERSION"}
: ${CLUSTER_LOGIN_URL_OIDCIDP?"Must set CLUSTER_LOGIN_URL_OIDCIDP"}
: ${SERVICE_DOCS_URL?"Must set SERVICE_DOCS_URL"}

mkdir -p /usr/share/nginx/html/agreements/terms_of_use/
mkdir -p /usr/share/nginx/html/agreements/sla/
# mkdir -p /usr/share/nginx/html/accessibility/

yasha -o /usr/share/nginx/html/index.html index.html.j2
yasha -o /usr/share/nginx/html/terms_of_use.html terms_of_use.html.j2
yasha -o /usr/share/nginx/html/agreements/terms_of_use/index.html terms_of_use.html.j2
yasha -o /usr/share/nginx/html/agreements/sla/index.html sla.html.j2
yasha -o /usr/share/nginx/html/accessibility_statement.html accessibility_statement.html.j2
