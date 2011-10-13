# executed by command interpreter for login shells

# loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  
# TODO: Needed on unix but not on osx?
# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

# include local (Brew) bin path before system so brew-installed 
# utilities will be used in preference to system-installed (e.g. ctag)
if [ -d "/usr/local/bin" ] ; then
  PATH="/usr/local/bin:$PATH"
fi

# include path to .dotfiles scripts
PATH="$HOME/.bin:$PATH"

# include path to user bin if it exists 
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
