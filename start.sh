#!/bin/sh

substitute_hostname() {

    if test -z "$HOSTNAME"; then eval $(grep HOSTNAME .env); fi
    if test -z "$HOSTNAME"; then HOSTNAME=$(hostname); fi

    sed "s+\"API\": \"http://localhost/+\"API\": \"http://$HOSTNAME/+g" frontend/config.template.json > frontend/config.json
    sed "s+href=\"http://localhost/+href=\"http://$HOSTNAME/+g" backend/user_approved.template.html > backend/user_approved.html
    sed "s+href=\"http://localhost/+href=\"http://$HOSTNAME/+g" backend/user_invited.template.html > backend/user_invited.html
}

substitute_hostname
docker-compose up -d
