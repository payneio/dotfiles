#!/bin/bash

GCLOUD_HOME="$HOME/google-cloud-sdk"

if [ -d $GCLOUD_HOME ]; then

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '$HOME/google-cloud-sdk/path.bash.inc' ]; then
        source '$HOME/google-cloud-sdk/path.bash.inc'
    fi

    # The next line enables shell command completion for gcloud.
    if [ -f '$HOME/google-cloud-sdk/completion.bash.inc' ]; then
        source '$HOME/google-cloud-sdk/completion.bash.inc'
    fi

    echo "google cloud ready."

fi

