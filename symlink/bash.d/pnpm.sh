#!/bin/bash

if hash pnpm 2>/dev/null; then
  # Set PNPM_HOME based on platform
  if [[ "$OSTYPE" == "darwin"* ]]; then
    export PNPM_HOME="$HOME/Library/pnpm"
  else
    export PNPM_HOME="$HOME/.local/share/pnpm"
  fi
  
  # Add to PATH if not already there - this might be redundant with corepack
  # but ensures it works if moving between different setups
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
  
  echo "pnpm ready (via corepack)."
fi
