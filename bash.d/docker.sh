#!/bin/bash

case $OSTYPE in
  darwin*)
    ip_file="$HOME/.vars/docker_host_ip"
    if hash docker-machine 2>/dev/null && [ -f $IP_FILE ]; then
      eval `docker-machine env`
      echo "docker ready."
    fi
    ;;
  linux*)
    if hash docker 2>/dev/null && [ -f $IP_FILE ]; then
      echo "docker ready."
    fi
    ;;
esac
