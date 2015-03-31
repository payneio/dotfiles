#!/bin/bash

case $OSTYPE in 
  linux*)
    pathappend "/usr/lib/oracle/11.2/client64/bin"
    export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib/:$LD_LIBRARY_PATH
    export ORACLE_HOME=/usr/lib/oracle
    echo "oracle ready."
  ;;
esac
