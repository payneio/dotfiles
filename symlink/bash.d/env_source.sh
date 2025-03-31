#!/bin/bash
# Source ~/env.sh if it exists
if [ -f "$HOME/env.sh" ]; then
  source "$HOME/env.sh"
  echo "env.sh sourced."
fi