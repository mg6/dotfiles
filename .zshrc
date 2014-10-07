# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mrtazz"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export EDITOR='vim'

# Aliases
alias v="vim"
alias nano="vim"

# RVM
export PATH="$PATH:$HOME/.rvm/bin"
