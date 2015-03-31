#!/bin/bash

if hash tmux; then
  alias tmux="TERM=xterm-256color /usr/bin/tmux"
  echo "tmux ready."
fi


