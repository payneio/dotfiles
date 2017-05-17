#!/bin/bash

nvm_file=$HOME/.nvm/nvm.sh
if [ -f $nvm_file ]; then
  export NVM_DIR="$HOME/.nvm"
  source "$NVM_DIR/nvm.sh"
  echo "nvm ready."
fi

