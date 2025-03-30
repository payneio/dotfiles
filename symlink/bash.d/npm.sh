#!/bin/bash

if hash npm 2>/dev/null; then
  pathappend "/usr/local/share/npm/bin"
  echo "npm ready."
fi