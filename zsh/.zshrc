# oh-my-zsh configuration
ZSH_THEME="mg6"
ZSH_CUSTOM=$HOME/.zsh_custom

plugins=(
    git
    mercurial
    fzf
    tmux
)

if [ -z "$TMUX" ] && command -v tmux &>/dev/null; then
    ZSH_TMUX_AUTOSTART=true
fi

[[ -s "$HOME/.oh-my-zsh" ]] && export ZSH=$HOME/.oh-my-zsh && source $ZSH/oh-my-zsh.sh

# User scripts in PATH
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

# User configuration
export EDITOR="vim"
export VISUAL="$EDITOR"

# Aliases
alias gv="gvim"
alias hgpu="hg pull --update"
alias hgr="hg recent"
alias json-pretty="python -m json.tool"
alias less="less -r"
alias nano="vim"
alias tmux="tmux -2"
alias todo='grep -e "FIXME\|TODO" -r . -i'
alias v="vim"
alias yt="youtube-dl -x"

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

[ -s "$HOME/.zshrc_local" ] && source "$HOME/.zshrc_local"
