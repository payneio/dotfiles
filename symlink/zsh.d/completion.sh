#!/bin/zsh

# Initialize zsh completion system
autoload -Uz compinit && compinit

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
