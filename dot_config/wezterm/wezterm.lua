local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'Regular' })
config.font_size = 13

config.color_scheme = 'Gruvbox dark, soft (base16)'

return config
