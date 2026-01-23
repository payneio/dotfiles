#!/bin/zsh

# Initialize zsh completion system
autoload -Uz compinit && compinit

# cdp and aliases. This setup allows you to quickly navigate to predefined
# directory paths with tab completion. For example, if CDP_DIRS contains paths
# like "/home/projects" and "/var/www", typing "cdp pro<tab>" would complete to
# directories under "/home/projects".
_cdp() {
    local dirs_var="${words[1]:u}_DIRS"
    local -a dirs completions
    dirs=(${(P)dirs_var})
    for dir in $dirs; do
        if [[ -d "$dir" ]]; then
            completions+=("$dir"/*(/:t))
        fi
    done
    _describe 'directories' completions
}
compdef _cdp cdp


# ---------------------------------------------------------------------------


# ANSI colours
# ---------------------------------------------------------------------------
_complete_ansi_color()
{
    local colors=(black red green brown blue purple cyan light_gray dark_gray light_red light_green yellow light_blue light_purple light_cyan white none)
    _describe 'colors' colors
}
compdef _complete_ansi_color set_prompt_color
compdef _complete_ansi_color ansi_color
# ---------------------------------------------------------------------------
