# env
export LSCOLORS=gxfxcxdxbxegedabagacad
set -x FZF_DEFAULT_OPTS "--layout=reverse --inline-info --exit-0 -m"
set -x FZF_DEFAULT_COMMAND "ag -g ."
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

# alias
alias prev="fzf --preview 'bat --style=numbers --color=always {}'"
alias gs='git status'
alias gd='git diff'

