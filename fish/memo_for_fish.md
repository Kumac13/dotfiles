# Intallation of fish
```sh
brew install fish
````

# Installation of Fihser
```sh
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

# Installation of Plugins
```sh
fisher install oh-my-fish/theme-bobthefish

fisher install jethrokuan/z

fisher install jethrokuan/fzf

fisher install decors/fish-ghq
```

# Set auto complete
```sh
fish_update_completions
```

# Change 'ls' command color 
```sh
touch ~/.config/fish/config.fish
export LSCOLORS=gxfxcxdxbxegedabagacad
```

# Add Functions 
```sh
ln -sf ~/ghq/github.com/Kumac13/dotfiles/fish/memo.fish ~/.config/fish/functions/

ln -sf ~/ghq/github.com/Kumac13/dotfiles/fish/fish_user_key_bindings.fish ~/.config/fish/functions/
```
