FROM aokinobu/debian
MAINTAINER Nobuyuki Aoki "aokinobu@gmail.com"

RUN mkdir /data
#VOLUME [ "/data" ]
ADD ./run.sh /run.sh
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
