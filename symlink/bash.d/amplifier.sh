#!/bin/bash

if hash amplifier 2>/dev/null; then
    # Amplifier shell completion
    eval "$(_AMPLIFIER_COMPLETE=bash_source amplifier)"
    
    echo "amplifier ready."
fi
