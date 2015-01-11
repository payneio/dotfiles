#!/bin/bash

# osx
if [ -e "/Applications/Google Chrome.app/" ]; then
  function chrome() { open -a "Google Chrome" "$1"; }
  function google() { open -a "Google Chrome" "http://www.google.com/search?q=$1"; }
fi

# ubuntu
if hash google-chrome 2>/dev/null; then
  alias chrome='google-chrome'
fi

