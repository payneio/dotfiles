#!/bin/zsh

# Zsh history configuration

# Ignore duplicates and commands starting with space
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Append to the history file, don't overwrite it
setopt APPEND_HISTORY

# Write to history immediately
setopt INC_APPEND_HISTORY

# Share history between sessions
setopt SHARE_HISTORY

# History size settings
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=~/.zsh_history

# Ignore common commands
HISTORY_IGNORE="(ls|cd|pwd)"
