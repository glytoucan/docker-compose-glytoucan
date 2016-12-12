#!/bin/sh
. ./user.triplestore.env
. ./triplestore.env
. ./google.env
. ./admin.env
#HOME=$HOME SPRING_PROFILE="-Dspring.profiles.active=development" ADMIN_KEY=$ADMIN_KEY GOOGLE_OAUTH2_CLIENTID=$GOOGLE_OAUTH2_CLIENTID GOOGLE_OAUTH2_CLIENTSECRET=$GOOGLE_OAUTH2_CLIENTSECRET SPRING_TRIPLESTORE_URL=$SPRING_TRIPLESTORE_URL SPRING_TRIPLESTORE_PASSWORD=$SPRING_TRIPLESTORE_PASSWORD USER_TRIPLESTORE_URL=$USER_TRIPLESTORE_URL USER_TRIPLESTORE_PASSWORD=$USER_TRIPLESTORE_PASSWORD docker-compose  -f docker-compose.yml -f docker-compose.prod.yml pull 
HOME=$HOME SPRING_PROFILE="-Dspring.profiles.active=development" ADMIN_KEY=$ADMIN_KEY GOOGLE_OAUTH2_CLIENTID=$GOOGLE_OAUTH2_CLIENTID GOOGLE_OAUTH2_CLIENTSECRET=$GOOGLE_OAUTH2_CLIENTSECRET SPRING_TRIPLESTORE_URL=$SPRING_TRIPLESTORE_URL SPRING_TRIPLESTORE_PASSWORD=$SPRING_TRIPLESTORE_PASSWORD USER_TRIPLESTORE_URL=$USER_TRIPLESTORE_URL USER_TRIPLESTORE_PASSWORD=$USER_TRIPLESTORE_PASSWORD docker-compose  -f docker-compose.yml -f docker-compose.prod.yml up
