#!/bin/bash

pathprepend "$HOME/.rbenv/bin"
if hash rbenv 2>/dev/null; then
  eval "$(rbenv init -)"
  echo "rbenv ready."
fi
