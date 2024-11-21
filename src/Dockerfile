# Builder image for Rahti static pages

FROM almalinux:8

LABEL maintainer="The CSC Rahti Team <rahti-team@postit.csc.fi>"


ARG CLUSTER_LANDING_PAGE_ENV_VERSION
ARG CLUSTER_LANDING_PAGE_SECONDARY_ENV_VERSION
ARG CLUSTER_LOGIN_URL_OIDCIDP

ENV LANG=en_US.UTF-8
ENV CLUSTER_LANDING_PAGE_ENV_VERSION=${CLUSTER_LANDING_PAGE_ENV_VERSION}
ENV CLUSTER_LANDING_PAGE_SECONDARY_ENV_VERSION=${CLUSTER_LANDING_PAGE_SECONDARY_ENV_VERSION}
ENV CLUSTER_LOGIN_URL_OIDCIDP=${CLUSTER_LOGIN_URL_OIDCIDP}

WORKDIR /tmp

RUN yum -y install epel-release &&\
    yum -y install nginx python39-pip python39 &&\
    yum clean all &&\
    chmod g+rwx /var/run /var/log/nginx

ENV ROOT_GROUP_DIRS='/var/run /var/log/nginx /var/lib/nginx'
RUN chgrp -R root ${ROOT_GROUP_DIRS} &&\
    chmod -R g+rwx ${ROOT_GROUP_DIRS}

COPY ./requirements.txt /tmp

RUN pip3 install --no-cache-dir -r requirements.txt

COPY ./make_config.sh /tmp
RUN chmod +x /tmp/make_config.sh

COPY ./static /usr/share/nginx/html/static
COPY html/footer.html /tmp
COPY html/index.html.j2 /tmp
COPY html/terms_of_use.html.j2 /tmp
COPY html/sla.html.j2 /tmp
COPY html/accessibility_statement.html.j2 /tmp

RUN sh -c /tmp/make_config.sh

CMD exit 0
