local wezterm = require('wezterm')
local act = wezterm.action
local config = wezterm.config_builder()

config.font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'Regular' })
config.font_size = 13

config.color_scheme = 'Gruvbox dark, soft (base16)'

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

config.keys = {
  -- MacOS native keybindings
  -- NOTE: Might not work well on linux
  { mods = "OPT",       key = "LeftArrow",  action = act.SendKey({ mods = "ALT", key = "b" }) },
  { mods = "OPT",       key = "RightArrow", action = act.SendKey({ mods = "ALT", key = "f" }) },
  { mods = "CMD",       key = "LeftArrow",  action = act.SendKey({ mods = "CTRL", key = "a" }) },
  { mods = "CMD",       key = "RightArrow", action = act.SendKey({ mods = "CTRL", key = "e" }) },
  { mods = "CMD",       key = "Backspace",  action = act.SendKey({ mods = "CTRL", key = "u" }) },
  { mods = "CMD|OPT",   key = "LeftArrow",  action = act.ActivateTabRelative(-1) },
  { mods = "CMD|OPT",   key = "RightArrow", action = act.ActivateTabRelative(1) },
  { mods = "CMD|SHIFT", key = "LeftArrow",  action = act.ActivateTabRelative(-1) },
  { mods = "CMD|SHIFT", key = "RightArrow", action = act.ActivateTabRelative(1) },

  -- CTRL+SHIFT+Space, followed by 'r' will put us in resize-pane
  -- mode until we cancel that mode.
  {
    mods = 'CTRL',
    key = 'p',
    action = act.ActivateKeyTable { name = 'pane', one_shot = false, },
  },
}


config.key_tables = {
  -- Defines the keys that are active in our resize-pane mode.
  -- Since we're likely to want to make multiple adjustments,
  -- we made the activation one_shot=false. We therefore need
  -- to define a key assignment for getting out of this mode.
  -- 'resize_pane' here corresponds to the name="resize_pane" in
  -- the key assignments above.
  pane = {
    { key = 'n',      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'Escape', action = 'PopKeyTable' },
  },
  resize_pane = {
    { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape',     action = 'PopKeyTable' },
  },
}

return config
