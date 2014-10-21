#!/bin/bash

gc_sdk_path="$HOME/google-cloud-sdk"
if [ -d $gc_sdk_path ]; then
  source $gc_sdk_path/path.bash.inc
  source $gc_sdk_path/completion.bash.inc
  echo "Google Cloud SDK ready."
fi
