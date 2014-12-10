#!/bin/bash

ip_file="$HOME/.vars/fleetctl_tunnel_ip"
if hash fleetctl 2>/dev/null && [ -f $ip_file ]; then
  export FLEETCTL_TUNNEL=$(< $ip_file)
  alias fc='fleetctl'
  alias fcj='fleetctl journal'
  alias fclm='fleetctl list-machines'
  alias fclu='fleetctl list-units'
  echo "fleetctl ready."
fi