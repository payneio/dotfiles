#!/bin/bash

if hash kubectl 2>/dev/null; then
  source <(kubectl completion bash)
  echo "kubectl ready."
fi