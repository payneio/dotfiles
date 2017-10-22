case $OSTYPE in
  linux*)
    # export GPG_TTY=$(tty)
    # if [ -f "${HOME}/.gpg-agent-info" ]; then
    #   . "${HOME}/.gpg-agent-info"
    #   export GPG_AGENT_INFO
    # fi
    if test -f $HOME/.gpg-agent-info && \
      kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
        GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info`
        export GPG_AGENT_INFO
    else
      eval `gpg-agent --daemon`
    fi
    export GPG_TTY=tty
    echo "gpg ready."
  ;;
esac
