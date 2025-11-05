# dotfiles

## How to Use

## How to build vim
https://zenn.dev/pu_ri/articles/1ea8979194a90b

### For EC2/WSL2 (Ubuntu)
```fish
ghq get git@github.com:vim/vim.git

# 依存関係のインストール
sudo apt-get update
sudo apt-get install -y lua5.3 liblua5.3-dev
sudo apt-get install -y luajit
sudo apt-get install -y libluajit-5.1-dev
sudo apt-get update
sudo apt-get install -y tcl-dev

asdf plugin-add python
asdf install python latest
asdf global python latest

asdf plugin-add ruby
asdf install ruby latest
asdf global ruby latest

# vimのレポジトリで実行する
./configure \
        --with-features=huge \
        --enable-gui=gtk3 \
        --enable-python3interp \
        --enable-luainterp \
        --enable-tclinterp \
        --enable-rubyinterp \
        --with-luajit \
        --enable-fail-if-missing \
        --prefix=/opt/vim

make
sudo make install
```

### For macOS (Homebrew)
```bash
ghq get git@github.com:vim/vim.git

# 依存関係のインストール
brew install luajit
brew install tcl-tk
brew install ruby
brew install python

# vimのレポジトリで実行する
./configure \
        --with-features=huge \
        --enable-python3interp \
        --enable-luainterp \
        --enable-tclinterp \
        --enable-rubyinterp \
        --with-luajit \
        --with-lua-prefix=/opt/homebrew \
        --enable-fail-if-missing \
        --prefix=/opt/vim

make
sudo make install
```

**注意**: macOSでは `--enable-gui=gtk3` を指定しない（GUIが必要な場合はMacVimを使用）

