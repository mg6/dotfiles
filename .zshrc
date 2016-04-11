# oh-my-zsh configuration
ZSH_THEME="mg6"
plugins=(git mercurial rvm)

[[ -s "$HOME/.oh-my-zsh" ]] && export ZSH=$HOME/.oh-my-zsh && source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR="vim"
export VISUAL="$EDITOR"

# Aliases
alias gv="gvim"
alias hgpu="hg pull --update"
alias hgr="hg recent"
alias json-pretty="python -m json.tool"
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
api-diff() {
    diff -u <(curl "$1" | python -m json.tool) <(curl "$2" | python -m json.tool)
}

kw() {
    grep $* -r .
}

noh() {
    nohup $* &>/dev/null &
}

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

alias show="kw"

# Android tools
if [ -d "$HOME/Android/Sdk/platform-tools" ]; then
    export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
fi

# RVM
if [[ -d "$HOME/.rvm" ]] then
    export PATH="$PATH:$HOME/.rvm/bin"
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
fi

[ -s "$HOME/.zshrc_local" ] && source "$HOME/.zshrc_local"
