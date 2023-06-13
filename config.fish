# env
export LSCOLORS=gxfxcxdxbxegedabagacad
set -x LANG "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

fish_vi_key_bindings

# alias
alias prev="fzf --preview 'bat --style=numbers --color=always {}'"
alias postgrestart='pg_ctl -D /usr/local/var/postgres start'
alias wnt='cd ~/project/'
alias vi='vim'

# path
# set RUBY_VERSION (ruby -v | sed 's/ruby ([0-9]\.[0-9]\.[0-9]).*/\1/')
set -x PATH /usr/local/bin/python3 /usr/local/bin /usr/sbin $PATH
set -x PGDATA /usr/local/var/postgres
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/versions/2.7.4/bin  $PATH
set -x PATH $HOME/.nodenv/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
eval (nodenv init - | source)
rbenv init - fish | source
status --is-interactive; and source (rbenv init -|psub)

if uname -r | grep 'micro' >/dev/null
  if status --is-interactive
    status --is-command-substitution; or source (jenv init -|psub)
  end
  cd $HOME
end
