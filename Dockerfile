FROM debian:jessie
MAINTAINER Chema Barcala <chema.barcala@gmail.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl libapache2-mod-php5 php5-mysql && \
    rm -rf /var/cache/apt /var/lib/apt /var/lib/dpkg && \
    a2enmod rewrite headers && \
    sed -i -e 's:${APACHE_LOG_DIR}/access.log:/dev/stdout:' -e 's:${APACHE_LOG_DIR}/error.log:/dev/stderr:' /etc/apache2/sites-available/*

COPY bootstrap.sh /
RUN chmod +x /bootstrap.sh

EXPOSE 80

ENTRYPOINT [ "/bootstrap.sh" ]

