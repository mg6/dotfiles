PROMPT='%{$fg_bold[red]%}%m%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%}%{$fg_bold[green]%}$(git_prompt_info2)$(hg_prompt_info2)%{$reset_color%}% %{$fg_bold[yellow]%}$(vault_info)%{$reset_color%}%  %# '

# RPROMPT='%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}% '

ZSH_THEME_GIT_PROMPT_PREFIX="(git "
# %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}✗%{$fg[green]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"

ZSH_THEME_HG_PROMPT_PREFIX=" (hg "
ZSH_THEME_HG_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_HG_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_CLEAN
ZSH_THEME_HG_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN

git_prompt_info2() {
  if $(git status >/dev/null 2>/dev/null); then
    echo -n ' '
    git_prompt_info
  fi
}

hg_prompt_info2() {
  if [ $(in_hg) ]; then
    hg_prompt_info
  fi
}

vault_info() {
  if ! [ -z "${AWS_VAULT+x}" ]; then
    echo -n ' '
    echo "(as $AWS_VAULT)"
  fi
}
