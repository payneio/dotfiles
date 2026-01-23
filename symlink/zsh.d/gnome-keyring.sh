
if [ -f /usr/bin/gnome-keyring-daemon ]; then
    eval "$(/usr/bin/gnome-keyring-daemon --start 2>/dev/null)" >/dev/null
    export GNOME_KEYRING_CONTROL
    export SSH_AUTH_SOCK
    echo "gnome-keyring ready."
fi
