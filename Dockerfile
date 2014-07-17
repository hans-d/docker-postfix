# Autogenerated - do not edit
FROM hansd/base-14.04
MAINTAINER Hans Donner <hans.donner@pobox.com> "https://github.com/hans-d"

RUN mkdir -p /docker/scripts
RUN mkdir -p /docker/templates


RUN apt-get -y install postfix

RUN apt-get -y install python-setuptools && \
    easy_install supervisor

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /etc/supervisor/conf.d

ADD common/supervisor/supervisor.conf /etc/supervisor.conf
ADD common/supervisor/scripts /docker/scripts


ADD scripts /docker/scripts
RUN chmod +x /docker/scripts/*

ADD templates /docker/templates


ENTRYPOINT ["/docker/scripts/start"]


EXPOSE 25
