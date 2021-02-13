# env
export LSCOLORS=gxfxcxdxbxegedabagacad
set -x LANG "en_US.UTF-8"

# alias
alias prev="fzf --preview 'bat --style=numbers --color=always {}'"

# path
set -x PATH $HOME/.pyenv/bin $PATH
set -x PGDATA /user/local/var/postgres

