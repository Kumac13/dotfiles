# env
export LSCOLORS=gxfxcxdxbxegedabagacad
set -x FZF_DEFAULT_OPTS "--layout=reverse --inline-info --exit-0 -m"
set -x FZF_DEFAULT_COMMAND "ag -g ."
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'
set -x LANG "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"

# alias
alias prev="fzf --preview 'bat --style=numbers --color=always {}'"
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gc='git checkout'

