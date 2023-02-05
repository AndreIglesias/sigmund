#!/usr/bin/env bash

# Install dependencies
apt-get update
apt-get -y upgrade
apt-get -y install openjdk-18-jre
rm -rf /var/lib/apt/lists/*

# Install signal-cli
wget https://github.com/AsamK/signal-cli/releases/download/v"${VERSION}"/signal-cli-"${VERSION}"-Linux.tar.gz
tar xf signal-cli-"${VERSION}"-Linux.tar.gz -C /opt
ln -sf /opt/signal-cli-"${VERSION}"/bin/signal-cli /usr/local/bin/

# Verify version
signal-cli -v

while 1:
      echo 'hello'
