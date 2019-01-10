# pip_bin="$HOME/.local/bin"
# if [ -d $pip_bin ]; then
#   pathappend "$HOME/.local/bin"
#   echo "python pip ready."
# fi

conda="$HOME/miniconda3"
if [ -d $conda ]; then
    export PATH="$conda/bin:$PATH"
    . $conda/etc/profile.d/conda.sh
    conda activate base
    echo "python conda ready."
fi

