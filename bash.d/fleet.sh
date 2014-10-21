ip_file="$HOME/.vars/fleetctl_tunnel_ip"
if [ -f $IP_FILE ]; then
  export FLEETCTL_TUNNEL=$(< $ip_file)
fi