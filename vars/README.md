This is a sort-of key-value store for bash scripts. The key is the filename, the value is the content of the file. Various scripts in bash.d then check for the existence of these files and use them appropriately.

Recognized files (key/values)
=============================
docker_host_ip
fleetctl_tunnel_ip
