if hash brew 2>/dev/null; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
  fi
  if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
        source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
  fi
fi

