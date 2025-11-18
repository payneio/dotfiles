# ~/.bash.d/git.sh

# For SSH/headless sessions, force terminal-based git auth and disable GUI askpass
if [[ -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]]; then
    # Make sure git prompts in the terminal instead of using GUI helpers
    export GIT_TERMINAL_PROMPT=1
    unset GIT_ASKPASS
    unset SSH_ASKPASS

    # Prevent git from trying to spawn a browser for auth flows
    export BROWSER=false
fi

if [[ -n "$USER_ALIAS" ]]; then
    export GITHUB_USERNAME="$USER_ALIAS"
fi

if [[ $- == *i* ]]; then
    echo "git ready."
fi
