#!/bin/bash

ip_file="$HOME/.vars/docker_host_ip"
if hash docker 2>/dev/null && [ -f $IP_FILE ]; then
  export DOCKER_HOST=tcp://$(< "$ip_file")
  echo "docker ready."
fi
