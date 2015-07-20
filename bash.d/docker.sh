#!/bin/bash

case $OSTYPE in
  darwin*)
    ip_file="$HOME/.vars/docker_host_ip"
    if hash docker 2>/dev/null && [ -f $IP_FILE ]; then

      export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
      export DOCKER_TLS_VERIFY=1
      export DOCKER_HOST=tcp://$(< "$ip_file")

      echo "docker ready."
    fi
    ;;
  linux*)
    if hash docker 2>/dev/null && [ -f $IP_FILE ]; then
      echo "docker ready."
    fi
    ;;
esac
