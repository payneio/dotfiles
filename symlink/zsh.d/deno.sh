
file="$HOME/.deno/env"
if [ -f $file ]; then
    source "$file"
    # Zsh completion for deno - generate if needed with: deno completions zsh > ~/.zsh.d/completions/_deno
    if [ -f "$HOME/.local/share/zsh/completions/_deno" ]; then
        fpath=("$HOME/.local/share/zsh/completions" $fpath)
    fi
  echo "deno ready."
fi
