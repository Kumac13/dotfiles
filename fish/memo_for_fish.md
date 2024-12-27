# Intallation of fish
```sh
brew install fish

sudo apt install fish
````

# Installation of Fihser
```sh
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

# Installation of Plugins
```sh
fisher install jethrokuan/z

fisher install jethrokuan/fzf

fisher install decors/fish-ghq
```

# Set auto complete
```sh
fish_update_completions
```

# Add Functions
```sh
ln -sf ~/ghq/github.com/Kumac13/dotfiles/fish/fish_user_key_bindings.fish ~/.config/fish/functions/
```
