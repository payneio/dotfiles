ip_file="$HOME/.vars/docker_host_ip"
if [ -f $IP_FILE ]; then
  export DOCKER_HOST=tcp://$(< "$ip_file")
fi
