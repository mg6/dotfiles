# oh-my-zsh configuration
ZSH_THEME="mg6"
plugins=(git mercurial rvm)

[[ -s "$HOME/.oh-my-zsh" ]] && export ZSH=$HOME/.oh-my-zsh && source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
export EDITOR='vim'

# Aliases
alias gv="gvim"
alias hgpu="hg pull --update"
alias hgr="hg recent"
alias nano="vim"
alias tmux="tmux -2"
alias todo='grep -e "FIXME\|TODO" -r . -i'
alias v="vim"

# Functions
kw() { grep $* -r . }

