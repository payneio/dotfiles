pathprepend "$HOME/.rbenv/bin"
if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
  eval "$(rbenv init -)"
fi
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi