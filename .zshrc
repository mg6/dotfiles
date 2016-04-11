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
alias yt="youtube-dl -x"

alias t="task"
alias st="task pro:Studia"
alias z="task pro:Zakupy"
alias kup="task pro:Zakupy add"

# Functions
kw() { grep $* -r . }

serve() {
    [[ -z "$1" ]] && port=8080 || port=$1

    if [[ -s "index.php" ]] {
        (sleep 1 && firefox localhost:$port)&
        php -S localhost:$port
    } elif [[ -d "_site" ]] {
        (sleep 1 && firefox localhost:$port)&
        jekyll serve --port $port
    } else {
        (sleep 1 && firefox localhost:$port)&
        python3 -m http.server $port
    }
}

# Android tools
if [ -d "$HOME/Android/Sdk/platform-tools" ]; then
    export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
fi

[ -s "$HOME/.zshrc_local" ] && source "$HOME/.zshrc_local"
