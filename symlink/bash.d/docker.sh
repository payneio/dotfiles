#!/bin/bash

if hash docker 2>/dev/null && [ -f $IP_FILE ]; then
  echo "docker ready."
fi
