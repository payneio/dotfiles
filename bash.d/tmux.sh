#!/bin/bash

if hash tmux 2>/dev/null; then
  alias tmux="TERM=xterm-256color /usr/bin/tmux"
  echo "tmux ready."
fi


