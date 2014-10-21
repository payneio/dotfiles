#!/bin/bash

if hash fasd 2>/dev/null; then
  # https://github.com/clvv/fasd
  eval "$(fasd --init auto)"
  echo "fasd ready."
fi