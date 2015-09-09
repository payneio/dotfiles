#!/bin/bash

nvm_file=$HOME/.nvm/nvm.sh
if [ -f $nvm_file ]; then
  source "$HOME/.nvm/nvm.sh"
  echo "nvm ready."
fi
