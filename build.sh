#!/bin/sh
. ./user.triplestore.env
. ./triplestore.env
. ./google.env
. ./admin.env
ADMIN_KEY=$ADMIN_KEY GOOGLE_OAUTH2_CLIENTID=$GOOGLE_OAUTH2_CLIENTID GOOGLE_OAUTH2_CLIENTSECRET=$GOOGLE_OAUTH2_CLIENTSECRET SPRING_TRIPLESTORE_URL=$SPRING_TRIPLESTORE_URL SPRING_TRIPLESTORE_PASSWORD=$SPRING_TRIPLESTORE_PASSWORD USER_TRIPLESTORE_URL=$USER_TRIPLESTORE_URL USER_TRIPLESTORE_PASSWORD=$USER_TRIPLESTORE_PASSWORD docker-compose build 
