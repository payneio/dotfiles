pip_bin="$HOME/.local/bin"
if [ -d $pip_bin ]; then
  pathappend "$HOME/.local/bin"
  echo "python pip ready."
fi

conda="$HOME/miniconda3"
if [ -d $conda ]; then
  pathprepend "$HOME/miniconda3/bin"
  source activate default
  echo "python conda ready."
fi

