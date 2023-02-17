#!/usr/bin/env bash

declare -a deb_dependencies=(
    [0]=docker
    [1]=docker-compose
)

########## main ##########

if [ "$(id -u)" -ne 0 ]; then

    echo "Configuring..."

    if [ ! -f ".env" ]; then
	cp dotenv .env
	echo "Cloned dotenv to .env"
	echo "Please fill the .env variables before building the project"
    fi
    
else
    echo "Installing..."
    apt-get -y update
    apt-get -y upgrade
    command -v docker > /dev/null 2>&1
    EXIT_STATUS=$?
    if ! (exit $EXIT_STATUS) ; then
	curl -sSL https://get.docker.com | sh
    fi
    apt-get -y install "${deb_dependencies[@]}"
fi
