PROMPT='%{$fg_bold[red]%}%m%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%}%{$fg_bold[green]%}$(git_prompt_info2)%{$reset_color%}% %{$fg_bold[yellow]%}$(vault_info)%{$reset_color%}%  %# '

# RPROMPT='%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}% '

ZSH_THEME_GIT_PROMPT_PREFIX="(git "
# %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}✗%{$fg[green]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"

git_prompt_info2() {
  if $(git status >/dev/null 2>/dev/null); then
    echo -n ' '
    git_prompt_info
  fi
}

vault_info() {
  local profile="${AWS_VAULT-${AWS_PROFILE}}"
  if ! [ -z "${profile}" ]; then
    echo -n ' '
    echo "(as $profile)"
  fi
}
