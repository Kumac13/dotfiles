# env
export LSCOLORS=gxfxcxdxbxegedabagacad
set -x LANG "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"
fish_vi_key_bindings

# alias
alias prev="fzf --preview 'bat --style=numbers --color=always {}'"

# path
#set -x PATH $HOME/.pyenv/bin $PATH
set -x PATH /usr/local/bin/python3 /usr/local/bin /usr/sbin $PATH
set -x PGDATA /user/local/var/postgres

