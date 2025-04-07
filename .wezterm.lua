local wezterm = require 'wezterm';

local config = {}

config.font = wezterm.font("Cica")
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.keys = {
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnCommandInNewTab {
      args = { "/opt/homebrew/bin/tmux", "new-session" },
    },
  },
}

return config
