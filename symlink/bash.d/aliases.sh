#!/bin/bash

alias reloadsh='source $HOME/.bashrc'
alias myalias='showaliases $DBASH/* $DBASH/local/after/* $DBASH/local/before/*'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..?='show_parent_dirs'

alias du1='du --max-depth 1'
alias dumd='du --max-depth'

alias clearcache='sudo sync; sudo echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null'

alias mc='mv' 

if hash xdg-open 2>/dev/null; then
  alias open='xdg-open'
fi

alias cls='clear && printf "\e[3J"'

alias glance='glance --config $HOME/.config/glance/glance.yml'
alias glance-edit='code --wait $HOME/.config/glance/glance.yml'
alias github-login='env -u DISPLAY BROWSER=false gh auth login --hostname github.com --git-protocol https --web'

