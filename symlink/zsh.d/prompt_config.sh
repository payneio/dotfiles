#!/bin/zsh

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
   debian_chroot=$(cat /etc/debian_chroot)
fi

# Zsh Prompt Items:
#
#   %n              Username of the current user
#   %m              Hostname up to the first '.'
#   %~              Current working directory (with ~ abbreviation)
#   %#              # for root, % for regular user
#   $debian_chroot  Current chroot (if any)
#
PS1NOCOLOR='%n@%m:%~%# '
PS1="$PS1NOCOLOR"

ansi_color()
{
   local COLOR_BLACK="\033[0;30m"
   local COLOR_RED="\033[0;31m"
   local COLOR_GREEN="\033[0;32m"
   local COLOR_BROWN="\033[0;33m"
   local COLOR_BLUE="\033[0;34m"
   local COLOR_PURPLE="\033[0;35m"
   local COLOR_CYAN="\033[0;36m"
   local COLOR_LIGHT_GRAY="\033[0;37m"
   local COLOR_DARK_GRAY="\033[1;30m"
   local COLOR_LIGHT_RED="\033[1;31m"
   local COLOR_LIGHT_GREEN="\033[1;32m"
   local COLOR_YELLOW="\033[1;33m"
   local COLOR_LIGHT_BLUE="\033[1;34m"
   local COLOR_LIGHT_PURPLE="\033[1;35m"
   local COLOR_LIGHT_CYAN="\033[1;36m"
   local COLOR_WHITE="\033[1;37m"
   local COLOR_NONE="\033[m"
   local color=$COLOR_NONE
   case "$1" in
      black)        color=$COLOR_BLACK;;
      red)          color=$COLOR_RED;;
      green)        color=$COLOR_GREEN;;
      brown)        color=$COLOR_BROWN;;
      blue)         color=$COLOR_BLUE;;
      purple)       color=$COLOR_PURPLE;;
      cyan)         color=$COLOR_CYAN;;
      light_gray)   color=$COLOR_LIGHT_GRAY;;
      dark_gray)    color=$COLOR_DARK_GRAY;;
      light_red)    color=$COLOR_LIGHT_RED;;
      light_green)  color=$COLOR_LIGHT_GREEN;;
      yellow)       color=$COLOR_YELLOW;;
      light_blue)   color=$COLOR_LIGHT_BLUE;;
      light_purple) color=$COLOR_LIGHT_PURPLE;;
      light_cyan)   color=$COLOR_LIGHT_CYAN;;
      white)        color=$COLOR_WHITE;;
      none)         color=$COLOR_NONE;;
   esac
   echo "$color"
}

set_prompt_color()
{
   local colorname=${1:-none}
   local promptcolor="%{$(ansi_color "$colorname")%}"
   local nocolor="%{$(ansi_color none)%}"
   PS1BAK="$PS1"
   PS1="${promptcolor}${PS1NOCOLOR}${nocolor}"
}

default_prompt_color()
{
   PS1="$PS1NOCOLOR"
}

# Starship prompt (overrides PS1 if available)
if command -v starship &>/dev/null; then
   # Install Nerd Font if not present (required for starship icons)
   NERD_FONT_DIR="$HOME/.local/share/fonts/NerdFonts"
   if [ ! -d "$NERD_FONT_DIR" ]; then
      echo "Installing JetBrainsMono Nerd Font for starship..."
      mkdir -p "$NERD_FONT_DIR"
      curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz \
         | tar -xJf - -C "$NERD_FONT_DIR"
      fc-cache -fv "$NERD_FONT_DIR" >/dev/null 2>&1
      echo "Nerd Font installed. Set your terminal font to 'JetBrainsMono Nerd Font'."
   fi
   eval "$(starship init zsh)"
fi
