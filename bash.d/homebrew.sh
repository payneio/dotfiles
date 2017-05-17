if hash brew 2>/dev/null; then

  pathprepend "/usr/local/bin"
  pathprepend "/usr/local/sbin"
  #export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

  if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
  fi
  if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
        source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
  fi

  echo "brew ready."

fi
