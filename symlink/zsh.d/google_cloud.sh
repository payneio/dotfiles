#!/bin/zsh

GCLOUD_HOME="$HOME/google-cloud-sdk"

if [ -d $GCLOUD_HOME ]; then

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f "$GCLOUD_HOME/path.zsh.inc" ]; then
        source "$GCLOUD_HOME/path.zsh.inc"
    fi

    # The next line enables shell command completion for gcloud.
    if [ -f "$GCLOUD_HOME/completion.zsh.inc" ]; then
        source "$GCLOUD_HOME/completion.zsh.inc"
    fi

    echo "google cloud ready."

fi
