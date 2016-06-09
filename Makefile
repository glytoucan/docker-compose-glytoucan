create:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up data
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 aokinobu/debian mkdir /data/rdf.glytoucan
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 aokinobu/debian mkdir /data/api
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 aokinobu/debian mkdir /data/soap.api
	docker tag dockercomposeglytoucan_data glycoinfo.org:5000/glytoucan_data:v${GTC_VERSION}

cp:
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 -v ${PWD}/rdf.glytoucan:/rdf.glytoucan aokinobu/debian rsync -avz /rdf.glytoucan/target/web-${GTC_VERSION}.jar /data/rdf.glytoucan/
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 -v ${PWD}/glytoucan-stanza:/glytoucan-stanza aokinobu/debian rsync -avz /glytoucan-stanza /data/
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 -v ${PWD}/glytoucan-js-stanza:/glytoucan-js-stanza aokinobu/debian rsync -avz /glytoucan-js-stanza /data/
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 -v ${PWD}/api:/api aokinobu/debian rsync -avz /api/target/api-${GTC_VERSION}.jar /data/api/
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 -v ${PWD}/soap.api:/soap.api aokinobu/debian rsync -avz /soap.api/api.soap/target/soap-${GTC_VERSION}.jar /data/soap.api/
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 -v ${PWD}/pom-site:/pom-site aokinobu/debian rsync -avz /pom-site /data/

ls:
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 aokinobu/debian ls -alrt /data/rdf.glytoucan

bash:
	docker run --rm -it -v source.v${GTC_VERSION}:/workspace --workdir /workspace/rdf.glytoucan dockercomposeglytoucan_java /bin/bash

tag:
	docker tag glytoucan_web:v${GTC_VERSION} glycoinfo.org:5000/glytoucan_web:v${GTC_VERSION}
#docker run -v /etc/localtime:/etc/localtime:ro -i -t mattdm/fedora /bin/bash

push:
	docker push glycoinfo.org:5000/glytoucan_web:v${GTC_VERSION}
	docker push glycoinfo.org:5000/glytoucan_stanza:v${GTC_VERSION}
	docker push glycoinfo.org:5000/glytoucan_js-stanza:v${GTC_VERSION}
	docker push glycoinfo.org:5000/glytoucan_redirect:v${GTC_VERSION}
	docker push glycoinfo.org:5000/glytoucan_data:v${GTC_VERSION}

init:
	sudo docker run -d -v /opt/jenkins/mysql/lib:/var/lib/mysql:rw -v /opt/jenkins/mysql/etc:/etc/mysql:rw aoki/docker-jenkins /bin/bash -c "/usr/bin/mysql_install_db"

ps:
	sudo docker ps

stop:
	sudo docker stop docker-jenkins_bluetree

rm:
	sudo docker rm docker-jenkins_bluetree

logs:
	sudo docker logs --tail=100 -f docker-jenkins_bluetree

rmdir:
	sudo rm -rf /opt/jenkins/mysql/lib/*

ip:
	sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" docker-jenkins_bluetree

restart:
	sudo docker restart docker-jenkins_bluetree

dump:
	sudo docker export docker-jenkins_bluetree > mysql.docker-jenkins.tar

load:
	cat mysql.docker-jenkins.tar.gz | docker import - aoki/docker-mysql:mysql_bluetree

import:
	sudo docker run -d -v /home/aoki/workspace/docker-ubuntu-mysql/5.5/:/tmp aoki/docker-jenkins /bin/bash -c "/import_sql.sh root r00t /tmp/import.sql"

clean: stop rm build run
	echo "clean";

cleanall: stop rmdir rm build run
	echo "clean";

log:
	sudo docker logs -f docker-jenkins_bluetree

adminpw:
	docker exec -it $(DOCKERUSER)_jenkinsmaster_1 cat /var/jenkins_home/secrets/initialAdminPassword

.PHONY: build run test clean
