#!/bin/bash

pathappend "/usr/local/go/bin"
go_path="$HOME/go"
if [ -d $go_path ]; then
  export GOPATH=$go_path
  pathappend "$go_path/bin"
  alias gos="cd $go_path/src"
  echo "Go ready."
fi
