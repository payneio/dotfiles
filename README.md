# payneio Dot Files

These are the configuration files I want to have in every Linux box I use.

Original files copied from jdevera/dotfiles and heavily modified over time.

## Directory Structure

```
dotfiles/
├── symlink/         # Files to be symlinked into home directory
│   ├── bashrc       # Will become ~/.bashrc as a symlink
│   ├── inputrc      # Will become ~/.inputrc as a symlink
│   └── bash.d/      # Will become ~/.bash.d/ as a symlink
│       └── ...      # All files maintained as symlinks
│
├── copy/            # Files to be copied into home directory
│   ├── .local/bin/  # Will become ~/.local/bin/ as a copy
│   └── .gitconfig.tpl # Template for ~/.gitconfig
│
└── install.sh       # Installation script
```

## Installation

```bash
git clone git://github.com/payneio/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Directory-Based Approach

This dotfiles repository uses a directory-based approach:

- **symlink/** - Contains files that are installed as **symlinks**
  - Changes to the repo immediately affect your environment
  - Easy to track and commit changes back to the repo
  - Ideal for configuration files (bashrc, inputrc, etc.)

- **copy/** - Contains files that are installed as **copies**
  - Can be modified on each machine without affecting the repo
  - More robust if the repository is unavailable
  - Better for installation scripts and documentation

## A few more things to do on initial install

  On an ubuntu box, set up solarized color theme using:
  ./ubuntu_post_install

## Contents

This dotfiles repository contains configuration for:

### Bash Configuration

Bash configuration files live in the `.bash.d` directory.

`.bashrc` sources configuration files in this order:

 * Every file under `.bash.d/local/before/`
 * Every file under `.bash.d/`
 * Every file under `.bash.d/local/after/`

Contents of `.bash.d/local/` are not tracked by git, so this is the place to
add configuration files that are specific for the current machine.

### Template Files

Some configuration files (like `.gitconfig`) might contain sensitive data
or need machine-specific values. These are handled as templates.

Template files:
- End with `.tpl` extension
- Use `{{VARIABLE}}` format for placeholders
- Are processed by the `process_template.sh` script during installation

### Utility Scripts

Utility scripts are stored in `.local/bin/` and will be copied to your
home directory during installation. This ensures they're available in your
PATH.
