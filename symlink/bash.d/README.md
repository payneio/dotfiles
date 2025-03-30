# bash.d

Everything in this directory is executed when .bashrc is run.

Generally, these modules will try to detect is a particular piece of software is
installed (because these dotfiles are used on all my linux boxes, and they might
have different software) and, if it is, will set some configuration so the shell
works properly.

## Techniques for detecting software installs

Does a command work?

```bash
cmd = {{some command}}
if hash rbenv 2>/dev/null; then
  {{do stuff}}
  echo "did stuff."
fi
```

Is a file present?

```bash
file = "{{some file}}"
if [ -f $file ]; then
    {{do stuff}}
  echo "did stuff."
fi
```


Is a directory present?

```bash
directory="{{some_dir}}"
if [ -d "$ANDROID_SDK" ]; then
  {{do stuff}}
  echo "did stuff."
fi
```
