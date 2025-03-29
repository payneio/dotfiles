#!/bin/bash

if hash vim 2>/dev/null; then
    export DIFF=vimdiff
    export EDITOR=vim
    echo "vim ready."
fi
