# Apparently, this is needed for git authentication to pop a browser tab.
# export DISPLAY=:1

export DISPLAY=
export BROWSER=false
export GIT_ASKPASS=
export SSH_ASKPASS=
export GIT_TERMINAL_PROMPT=1

if [ -n "$USER_ALIAS" ]; then
    export GITHUB_USERNAME="$USER_ALIAS"
fi

echo "git ready."
