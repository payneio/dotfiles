#!/bin/zsh

rust_env="$HOME/.cargo/env"
if [ -f $rust_env ]; then
  pathprepend "$HOME/.cargo/bin"
  source "$rust_env"
  echo "rust ready."
fi
