#!/bin/sh
while [ ! -f /rdf.glytoucan/target/web-${GTC_VERSION}.jar ]
do
  echo waiting for web-${GTC_VERSION}.jar
  sleep 2
done
rsync -avz /rdf.glytoucan/target/web-${GTC_VERSION}.jar /data/rdf.glytoucan/
rsync -avz /glytoucan-stanza /data/
rsync -avz /glytoucan-js-stanza /data/
while [ ! -f /api/target/api-${GTC_VERSION}.jar ]
do
  echo waiting for api-${GTC_VERSION}.jar
  sleep 2
done
rsync -avz /api/target/api-${GTC_VERSION}.jar /data/api/
while [ ! -f /soap.api/api.soap/target/soap-${GTC_VERSION}.jar ]
do
  echo waiting for soap-${GTC_VERSION}.jar
  sleep 2
done
rsync -avz /soap.api/api.soap/target/soap-${GTC_VERSION}.jar /data/soap.api/
rsync -avz /pom-site /data/

