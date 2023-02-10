#
# Sigmund Signal Assistant
#
# https://github.com/AndreIglesias/sigmund
#
FROM ubuntu:22.04

ARG SIGNAL_CLI
ENV VERSION=${SIGNAL_CLI}
COPY ./config/config.sh .
RUN chmod +x config.sh && ./config.sh
