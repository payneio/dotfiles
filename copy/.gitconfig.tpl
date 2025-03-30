[user]
    name = {{GIT_NAME}}
    email = {{GIT_EMAIL}}
[github]
    user = {{GITHUB_USER}}
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
    ci = commit
    co = checkout
    diff = diff
    lg = log -p
    who = shortlog -s --
    slog = !git --no-pager log --format=oneline --abbrev-commit
    dfnp = !git --no-pager diff
    wc = whatchanged --stat
    st = status
    stat = status -sb
    br = branch -vv
    up = fetch --all -p
    d  = !read B RB <<<$(git branch -vv | ruby -ne 'puts $_.match(%r<\\* ([^\\s]+)\\s+\\w+\\s+\\[([^:\\]]+)>)[1,2] * \" \" rescue nil') && git wc ^$B $RB
    rd = !read B RB <<<$(git branch -vv | ruby -ne 'puts $_.match(%r<\\* ([^\\s]+)\\s+\\w+\\s+\\[([^:\\]]+)>)[1,2] * \" \" rescue nil') && git wc ^$RB $B
    m  = !read B RB <<<$(git branch -vv | ruby -ne 'puts $_.match(%r<\\* ([^\\s]+)\\s+\\w+\\s+\\[([^:\\]]+)>)[1,2] * \" \" rescue nil') && git merge $RB
    sub = submodule
    subup = !git submodule sync && git submodule update --init
    remotes = remote -v show
    rev = rev-parse HEAD
    cl = clone --recursive
    human = name-rev --name-only --refs=refs/heads/*
    humin = name-rev --name-only --refs=refs/heads/* --stdin
    graphviz = "!f() { echo 'digraph git {' ; git log --pretty='format:  %h -> { %p }' \"$@\" | sed 's/[0-9a-f][0-9a-f]*/\"&\"/g' ; echo '}'; }; f"
    sb = show-branch
    wd = diff --word-diff
    dt = difftool -y
    cat = cat-file
    ll = log --oneline --graph
    ls = ls-files
[core]
    excludesfile = ~/.gitignore-global
    whitespace=trailing-space,cr-at-eol,space-before-tab,tab-in-indent
[apply]
    whitespace = nowarn
[push]
    default = upstream
[branch]
    autosetupmerge = true
[credential]
    helper = cache --timeout=3600
[merge]
    stat = true
    conflictstyle = diff3
    defaultToUpstream = true
    renamelimit = 2000
[rerere]
    enabled = 1
    autoupdate = 1
[status]
    submodulesummary = true
[gc]
    reflogExpire = 180 days
    reflogExpireUnreachable = 90 days
    pruneExpire = 3 months ago