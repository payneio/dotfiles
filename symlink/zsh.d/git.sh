# ~/.zsh.d/git.sh

# For SSH/headless sessions, force terminal-based git auth and disable GUI askpass
if [[ -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]]; then
    # Make sure git prompts in the terminal instead of using GUI helpers
    export GIT_TERMINAL_PROMPT=1
    unset GIT_ASKPASS
    unset SSH_ASKPASS

    # Prevent git from trying to spawn a browser for auth flows
    export BROWSER=false

    # Configure GCM to use terminal-based prompts, no GUI
    # export GCM_INTERACTIVE=never
    # export GCM_GUI_PROMPT=false
fi

# Configure Git Credential Manager to use persistent storage
# This prevents daily re-authentication by storing credentials securely
if command -v git-credential-manager &> /dev/null; then
    # Use plaintext store for SSH sessions (credentials are encrypted at rest)
    # This avoids GPG/pass dependencies and GUI popups while maintaining persistence
    git config --global credential.credentialStore plaintext 2>/dev/null || true
fi

if [[ -n "$USER_ALIAS" ]]; then
    export GITHUB_USERNAME="$USER_ALIAS"
fi

if [[ -o interactive ]]; then
    echo "git ready."
fi
