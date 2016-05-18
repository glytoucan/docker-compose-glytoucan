FROM centos
MAINTAINER daisuke 

RUN yum install -y httpd
RUN yum install -y git
RUN yum install -y wget
RUN mkdir /stanza

WORKDIR /stanza
RUN wget https://github.com/togostanza/ts/releases/download/v0.0.8/ts_0.0.8_linux_amd64.tar.gz
RUN tar zxf ts_0.0.8_linux_amd64.tar.gz 

WORKDIR /
RUN git clone https://github.com/glytoucan/glytoucan-js-stanza.git

WORKDIR /glytoucan-js-stanza/glytoucan_stanza/entry_provider 

EXPOSE 8080
CMD ["/stanza/ts_0.0.8_linux_amd64/ts", "server"]

