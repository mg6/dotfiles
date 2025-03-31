#!/usr/bin/env zsh

# Fix async-prompt issue for git prompt
zstyle ':omz:alpha:lib:git' async-prompt no

# Configure basics
export EDITOR="vim"
export VISUAL="vim"

# Configure zsh plugins
export ZSH_TMUX_AUTOSTART=true
export ZSH_CUSTOM="${HOME}/.zsh_custom"

# Expose scripts in PATH
[ -d "${HOME}/.local/bin" ] && export PATH="${HOME}/.local/bin:${PATH}"
[ -d "${HOME}/bin" ] && export PATH="${HOME}/bin:${PATH}"

# Load zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
zgenom autoupdate

# Generate init script if doesn't exist
if ! zgenom saved; then
    echo "Creating a zgenom save"

    # Add this if you experience issues with missing completions or errors mentioning compdef.
    zgenom compdef

    # Ohmyzsh base library
    zgenom ohmyzsh

    # Plugins
    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/fzf
    zgenom ohmyzsh plugins/tmux

    # Source .zshrc.d
    zgenom load mattmc3/zshrc.d

    # Save all to init script
    zgenom save

    # Compile zsh files
    zgenom compile "${HOME}/.zshrc"
    zgenom compile "${HOME}/.zshrc.d"
    zgenom compile "${ZSH_CUSTOM}"
fi

# Theme
source "${ZSH_CUSTOM}/themes/mg6.zsh-theme"

# Adjust options
alias diff="diff -u"
alias less="less -r"
alias rsync="rsync --info=progress2"
alias tmux="tmux -2"
