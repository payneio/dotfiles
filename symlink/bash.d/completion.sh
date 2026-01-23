# ANSI colours
# ---------------------------------------------------------------------------
_complete_ansi_color()
{
   echo "black red green brown blue purple cyan light_gray dark_gray light_red light_green yellow light_blue light_purple light_cyan white none" |
   tr ' ' '\n' | grep "^$2.*"
}
complete -C _complete_ansi_color -o default set_prompt_color
complete -C _complete_ansi_color -o default ansi_color
# ---------------------------------------------------------------------------

# enable programmable completion features
if [ -f /usr/share/bash-completion/bash_completion ] && ! shopt -oq posix; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
