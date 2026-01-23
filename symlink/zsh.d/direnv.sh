if hash direnv 2>/dev/null; then
  eval "$(direnv hook zsh)"
  echo "direnv ready."
fi
