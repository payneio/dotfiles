#!/bin/bash

elasticsearch="/usr/local/opt/elasticsearch@2.3"
if [ -d $elasticsearch ]; then
    pathappend "$elasticsearch/bin"
    echo "elasticsearch 2.3 ready."
fi

