build:
	sudo docker build -t aoki/local.glytoucan .

buildnc:
	sudo docker build --no-cache -t aoki/local.glytoucan .

install:

run:
	sudo docker run -d --restart="always" -p 88:80 --link mariadb-localization_bluetree:local.glytoucan.org -v /mnt/jenkins/workspace/local.glytoucan:/var/www/html --name="local.glytoucan_bluetree" aoki/local.glytoucan

rundev:
	sudo docker run -d --restart="always" -p 88:80 --link mariadb-localization_bluetree:local.glytoucan.org -v ~/workspace/glytoucan_localization:/var/www/html --name="local.glytoucan_bluetree" aoki/local.glytoucan

runtest:
	sudo docker run -d --restart="always" -p 88:80 -v /mnt/jenkins/workspace/glytoucan_localization:/var/www/html --name="local.glytoucan_bluetree" aoki/local.glytoucan

bash:
	sudo docker run -it -v /opt/local.glytoucan:/local.glytoucan:rw --link glytoucan_prod:test.ts.glytoucan.org aoki/local.glytoucan /bin/bash

#runtest:
#	sudo docker run --rm -P --name local.glytoucan_bio_test aoki/local.glytoucan

#run-linked:
#	sudo docker run --rm -t -i -link local.glytoucan_bluetree:local.glytoucan aoki/local.glytoucan bash

backup:
	sudo docker run --rm --volumes-from local.glytoucan_bluetree -t -i busybox sh

clean: stop rm build run
	echo "clean"

cleanall: rmdir clean
	echo "clean"

rmdir: 
	sudo rm -rf /opt/local.glytoucan/*

setup:
	sudo ./setup.sh

ps:
	sudo docker ps

stop:
	sudo docker stop local.glytoucan_bluetree

logs:
	sudo docker logs -f --tail=100 local.glytoucan_bluetree

rm:
	sudo docker rm local.glytoucan_bluetree

ip:
	sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" local.glytoucan_bluetree

ssh:
#	ssh -i /usr/local/share/baseimage-docker/insecure_key root@172.17.0.8
	sudo docker-ssh local.glytoucan_bluetree

restart:
	sudo docker restart local.glytoucan_bluetree

dump:
	sudo docker export local.glytoucan_bluetree > local.glytoucan.glycoinfo.tar

load:
	cat local.glytoucan.glycoinfo.tar.gz | docker import - aoki/docker-local.glytoucan:local.glytoucan_bluetree
	
.PHONY: build run test clean
