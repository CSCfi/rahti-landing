# Builder image for Rahti static pages

FROM almalinux:8

LABEL maintainer="The CSC Rahti Team <rahti-team@postit.csc.fi>"


WORKDIR /tmp

RUN yum -y install python39-pip python39 &&\
    yum clean all &&\
    chmod g+rwx /var/run

ENV ROOT_GROUP_DIRS='/var/run'
RUN chgrp -R root ${ROOT_GROUP_DIRS} &&\
    chmod -R g+rwx ${ROOT_GROUP_DIRS}

COPY ./requirements.txt /tmp

RUN pip3 install --no-cache-dir -r requirements.txt


ARG CLUSTER_ENV_VERSION="Openshift 4.15 / Kubernetes 1.28"
ARG CLUSTER_LOGIN_URL_OIDCIDP="https://console-openshift-console.apps.2.rahti.csc.fi/dashboards"
ARG SERVICE_DOCS_URL="https://docs.csc.fi/cloud/rahti2/"

ENV LANG=en_US.UTF-8
ENV CLUSTER_ENV_VERSION=${CLUSTER_ENV_VERSION}
ENV CLUSTER_LOGIN_URL_OIDCIDP=${CLUSTER_LOGIN_URL_OIDCIDP}
ENV SERVICE_DOCS_URL=${SERVICE_DOCS_URL}


COPY ./make_config.sh /tmp
RUN chmod +x /tmp/make_config.sh

COPY ./static /usr/share/nginx/html/static
COPY html/footer.html /tmp
COPY html/index.html.j2 /tmp
COPY html/terms_of_use.html.j2 /tmp
COPY html/sla.html.j2 /tmp
COPY html/accessibility_statement.html.j2 /tmp

CMD sh -c /tmp/make_config.sh
