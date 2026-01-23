#!/bin/zsh

if [ -f "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/zsh_completion" ] && . "$NVM_DIR/zsh_completion"
  echo "nvm ready."
fi
