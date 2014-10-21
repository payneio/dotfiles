#!/bin/bash

gc_sdk_path="$HOME/go"
if [ -d $gc_sdk_path ]; then
  export GOPATH=$HOME/go
  pathappend "$GOPATH/bin"
  echo "Go ready."
fi