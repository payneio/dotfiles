#!/bin/bash

if hash rbenv 2>/dev/null; then
  pathprepend "$HOME/.rbenv/bin"
  eval "$(rbenv init -)"
  echo "rbenv ready."
fi
