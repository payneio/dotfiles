#!/bin/bash

if hash arduino 2>/dev/null; then

  export ARDUINO_DIR=/usr/share/arduino
  export ARDMK_DIR=$HOME/repos/Arduino-Makefile
  export AVR_TOOLS_DIR=/usr

  echo "arduino ready."

fi

