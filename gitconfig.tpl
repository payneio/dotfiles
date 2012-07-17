#!/bin/bash

[[ -z ${GIT_NAME+x}         ]] && read -p "Your Name: " GIT_NAME
[[ -z ${GIT_EMAIL+x}        ]] && read -p "Your Email: " GIT_EMAIL
[[ -z ${GITHUB_USER+x}      ]] && read -p "GitHub Username: " GITHUB_USER

cat <<EOF
[user]
    name = $GIT_NAME
    email = $GIT_EMAIL
[color]
    diff = auto
    status = auto
    branch = auto
[alias]
    st = status
    ci = commit
    br = branch
    co = checkout
    df = diff
    lg = log -p
    who = shortlog -s --
    slog  = !git --no-pager log --format=oneline --abbrev-commit
    dfnp  = !git --no-pager diff
[github]
    user = $GITHUB_USER
[credential]
    helper = cache --timeout=3600
EOF

# vim: filetype=bash :
