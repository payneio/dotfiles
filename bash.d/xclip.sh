#!/bin/bash

if hash xclip 2>/dev/null; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
  echo "xclip pbcopy/paste emulation ready."
fi

