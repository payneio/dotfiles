#!/bin/zsh

nvm_file=$HOME/.nvm/nvm.sh
if [ -f $nvm_file ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  echo "nvm ready."
fi
