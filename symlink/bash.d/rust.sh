#!/bin/bash

rust_env="$HOME/.cargo/env"
if [ -f $rust_env ]; then
  source "$rust_env"
  echo "rust ready."
fi
