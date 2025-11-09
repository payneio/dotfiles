#!/bin/bash
bun_bin_dir=$HOME/.bun/bin
if [ -d $bun_bin_dir ]; then
  pathappend "$bun_bin_dir"
  echo "bun ready."
fi
