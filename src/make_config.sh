#!/bin/sh

set -e

mkdir -p /usr/share/nginx/html/agreements/terms_of_use/
mkdir -p /usr/share/nginx/html/agreements/sla/
mkdir -p /usr/share/nginx/html/static

cp -r /tmp/static /usr/share/nginx/html

yasha -v index_content.yaml -o /usr/share/nginx/html/index.html index.html.j2
yasha -o /usr/share/nginx/html/terms_of_use.html terms_of_use.html.j2
yasha -o /usr/share/nginx/html/agreements/terms_of_use/index.html terms_of_use.html.j2
yasha -o /usr/share/nginx/html/agreements/sla/index.html sla.html.j2
yasha -o /usr/share/nginx/html/accessibility_statement.html accessibility_statement.html.j2
