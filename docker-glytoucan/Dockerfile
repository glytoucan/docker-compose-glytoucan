FROM aokinobu/apache
MAINTAINER Nobuyuki Aoki "aokinobu@gmail.com"

RUN apt-get update

WORKDIR /

ADD run.sh /run.sh
RUN chmod a+x /run.sh

ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD 010-test.api.conf /etc/apache2/sites-available/010-test.api.conf
ADD 020-test.soap.api.conf /etc/apache2/sites-available/020-test.soap.api.conf

RUN a2ensite 000-default.conf
RUN a2ensite 010-test.api.conf
RUN a2ensite 020-test.soap.api.conf
RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_http

ADD proxytimeout.conf /etc/apache2/conf-available/proxytimeout.conf
RUN a2enconf proxytimeout

EXPOSE 80 443
WORKDIR /

CMD ["/run.sh"]
