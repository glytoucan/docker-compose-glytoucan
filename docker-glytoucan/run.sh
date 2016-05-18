#!/bin/bash
source /etc/apache2/envvars
#a2ensite 000-default.conf
#a2enmod rewrite
#a2enmod proxy
#a2enmod proxy_http
#echo remove localization files
#rm /opt/prod.glytoucan/tmp/glytoucan.localization/*.doc
#exec /usr/sbin/apache2 -e info -D FOREGROUND
exec apache2ctl -e debug -DFOREGROUND >> /var/log/apache2/sysout.log 2> /var/log/apache2/errout.log
