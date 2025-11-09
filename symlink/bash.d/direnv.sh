if hash direnv 2>/dev/null; then
  eval "$(direnv hook bash)"
  echo "direnv ready."
fi