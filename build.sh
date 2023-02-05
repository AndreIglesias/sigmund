#!/usr/bin/env bash

declare -a deb_dependencies=(
    [0]=docker
    [1]=docker-compose
)

########## main ##########

if [ "$(id -u)" -ne 0 ]; then

    echo "Configuring..."
    echo 'VERSION="0.11.6"' >> .env
    
else

    apt-get -y update
    apt-get -y upgrade
    command -v docker > /dev/null 2>&1
    EXIT_STATUS=$?
    if ! (exit $EXIT_STATUS) ; then
	curl -sSL https://get.docker.com | sh
    fi
    apt-get -y install docker-compose
    echo "Installing..."

fi
