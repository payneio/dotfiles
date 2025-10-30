
file="$HOME/.deno/env"
if [ -f $file ]; then
    source "$file"
    if [ -f "$HOME/.local/share/bash-completion/completions/deno.bash" ]; then
        source "$HOME/.local/share/bash-completion/completions/deno.bash"
    fi
  echo "deno ready."
fi
