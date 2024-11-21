# Builder image for Rahti static pages

FROM almalinux:8

LABEL maintainer="The CSC Rahti Team <rahti-team@postit.csc.fi>"


WORKDIR /tmp

RUN yum -y install nginx python39-pip python39 &&\
    yum clean all

RUN chmod g+rwx /var/run /var/log/nginx

# These need to be owned and writable by the root group in OpenShift
ENV ROOT_GROUP_DIRS='/var/run /var/log/nginx /var/lib/nginx'

RUN chgrp -R root ${ROOT_GROUP_DIRS} &&\
    chmod -R g+rwx ${ROOT_GROUP_DIRS}

RUN sed -i 's/80 default_server/8080 default_server/g' /etc/nginx/nginx.conf
RUN sed -i 's/user nginx/#user nginx/g' /etc/nginx/nginx.conf

COPY ./requirements.txt /tmp

RUN pip3 install --no-cache-dir -r requirements.txt

COPY ./make_config.sh /tmp
RUN chmod +x /tmp/make_config.sh

COPY ./static /tmp/static
COPY html/footer.html /tmp
COPY html/index.html.j2 /tmp
COPY html/index_content.yaml /tmp
COPY html/terms_of_use.html.j2 /tmp
COPY html/sla.html.j2 /tmp
COPY html/accessibility_statement.html.j2 /tmp

CMD sh -c /tmp/make_config.sh
