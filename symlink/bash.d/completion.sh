# cdp and aliases. This setup allows you to quickly navigate to predefined
# directory paths with tab completion. For example, if CDP_DIRS contains paths
# like "/home/projects" and "/var/www", typing "cdp pro<tab>" would complete to
# directories under "/home/projects".
_cdp() {
    local IFS=$'\t\n'
    local dirs=$(echo ${COMP_WORDS[0]} | tr [:lower:] [:upper:])_DIRS[@]
    COMPREPLY=( $(
        for dir in "${!dirs}"; do
            for i in $(
                cd "$dir" 2> /dev/null && 
                compgen -d -- "${COMP_WORDS[COMP_CWORD]}"
            ); do
                    #  If i not dir in current dir, append extra slash '/'
                    #  NOTE: With bash > v2, if i is also dir in current dir, 
                    #+       'complete -o filenames' automatically appends 
                    #+       slash '/'
                (( $BASH_VERSINFO == 2 )) || [ ! -d ${i#$dir} ] && i="$i/"
                echo "$i"
            done
        done
    ) )
    return 0
} # _cdp()

# NOTE: '-o filenames' escapes special characters, whereas '-o dirnames' doesn't
complete -o filenames -o nospace -F _cdp cdp


# ---------------------------------------------------------------------------


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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
