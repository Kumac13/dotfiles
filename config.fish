# env
export LSCOLORS=gxfxcxdxbxegedabagacad
set -x LANG "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"
fish_vi_key_bindings

# alias
alias prev="fzf --preview 'bat --style=numbers --color=always {}'"
alias postgrestart='pg_ctl -D /usr/local/var/postgres start'

# path
set -x PATH /usr/local/bin/python3 /usr/local/bin /usr/sbin $PATH
set -x PGDATA /usr/local/var/postgres
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.nodenv/bin $PATH
set -x PATH $HOME/go/bin $PATH
eval (nodenv init - | source)
rbenv init - fish | source
status --is-interactive; and source (rbenv init -|psub)

