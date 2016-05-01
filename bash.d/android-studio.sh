#!/bin/bash

case $OSTYPE in
  linux*)
    if [ -d "/usr/local/android-studio" ]; then
        pathappend "/usr/local/android-studio/bin"
        export IBUS_ENABLE_SYNC_MODE=1
        export ANDROID_HOME=~/Android/Sdk
        echo "android studio ready."
    fi
  ;;
esac
