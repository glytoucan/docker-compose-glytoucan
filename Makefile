create:
	docker-compose -f docker-compose.clean.yml up --remove-orphans
	docker-compose -f docker-compose.build.yml up --remove-orphans
	docker commit dockercomposeglytoucan_data_1 glycoinfo.org:5000/glytoucan_data:v${GTC_VERSION}

ls:
	docker run --rm --volumes-from dockercomposeglytoucan_data_1 aokinobu/debian ls -alrt /data/rdf.glytoucan

bash:
	docker run --rm -it -v source.v${GTC_VERSION}:/workspace --workdir /workspace/rdf.glytoucan dockercomposeglytoucan_java /bin/bash

tag:
	docker tag dockercomposeglytoucan_data_1 glycoinfo.org:5000/glytoucan_data:v${GTC_VERSION}
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
