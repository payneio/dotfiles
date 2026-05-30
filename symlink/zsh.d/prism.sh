#!/bin/zsh

if hash prism 2>/dev/null; then
  export PRISM_DIR="$HOME/.prism"
  if [[ ! -d "$PRISM_DIR" ]]; then
    mkdir -p "$PRISM_DIR"
  fi
  echo "prism ready."
fi
