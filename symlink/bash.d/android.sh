#!/bin/bash

case $OSTYPE in
  linux*)
    ANDROID_SDK="$HOME/Android/Sdk"
    if [ -d "$ANDROID_SDK" ]; then
        pathappend "$ANDROID_SDK/platform-tools"
        pathappend "$ANDROID_SDK/tools"
        export ANDROID_HOME=~/Android/Sdk
        echo "android ready."
    fi
  ;;
esac
