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
alias vimo='vimobox local open'

if uname -r | grep 'micro' >/dev/null
  set -x PATH $HOME/.yarn/bin $PATH
  set -x PATH $HOME/.sdk/bin $PATH
  set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH

  alias explorer.exe='/mnt/c/Windows/explorer.exe'

  if status --is-interactive
    status --is-interactive; and source (jenv init - --no-rehash fish | psub)
  end

  if pwd | grep 'mnt' >/dev/null
    cd $HOME
  end
end

# path
set -x PATH /usr/local/bin/python3 /usr/local/bin /usr/sbin $PATH
set -x PGDATA /usr/local/var/postgres
set -x PATH $HOME/go/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.deno/bin $PATH

# To set up asdf, use below command
# echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish
# https://asdf-vm.com/ja-jp/guide/getting-started.html
source /opt/homebrew/opt/asdf/libexec/asdf.fish
