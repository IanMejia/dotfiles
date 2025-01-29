local wezterm = require("wezterm")
local act = wezterm.action


local config = {}

-- Check to use config_builder if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
config.color_scheme = "catppuccin-mocha"

config.font = wezterm.font_with_fallback({
  { family = "Mononoki Nerd Font",      scale = 1.2 },
  { family = "Mononoki",                scale = 1.2 },
  { family = "Monaspace Krypton",       scale = 1.2 },
  { family = "Monaspace Neon",          scale = 1.2 },
  { family = "Fira Code Medium",        scale = 1.2 },
  { family = "FiraCode Nerd Font Mono", scale = 1.2 },
})
config.warn_about_missing_glyphs = false

config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.default_workspace = "home"

-- deal with inactive panes
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5
}

-- keybinds
--
local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

if is_linux() then
  config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 }
end

if is_darwin() then
  config.leader = { key = "a", mods = "CMD", timeout_milliseconds = 1000 }
end

config.keys = {
  -- send C-a when pressed twice to avoid conflicting keybinds
  { key = "a", mods = "LEADER",       action = act.SendKey { key = "a", mods = "CTRL" } },
  { key = "c", mods = "LEADER",       action = act.ActivateCopyMode },

  -- panels
  { key = "-", mods = "LEADER",       action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "x", mods = "LEADER",       action = act.CloseCurrentPane { confirm = true } },
  { key = "s", mods = "LEADER",       action = act.RotatePanes "Clockwise" },
  { key = "r", mods = "LEADER",       action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },

  -- panel navigation
  { key = "h", mods = "LEADER",       action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER",       action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER",       action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER",       action = act.ActivatePaneDirection("Right") },

  -- tab keybinds
  { key = "n", mods = "LEADER",       action = act.SpawnTab("CurrentPaneDomain") },
  { key = "[", mods = "LEADER",       action = act.ActivateTabRelative(-1) },
  { key = "]", mods = "LEADER",       action = act.ActivateTabRelative(1) },
  { key = "t", mods = "LEADER",       action = act.ShowTabNavigator },

  -- tab key-table for distributing tabs
  { key = "m", mods = "LEADER",       action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },

  -- worskpaces
  { key = "w", mods = "LEADER",       action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },


}

-- navigate tabs with index
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1)
  })
end

config.key_tables = {
  resize_pane = {
    { key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
    { key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
    { key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
    { key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" }
  },

  move_tab = {
    { key = "h",      action = act.MoveTabRelative(-1) },
    { key = "j",      action = act.MoveTabRelative(-1) },
    { key = "k",      action = act.MoveTabRelative(1) },
    { key = "l",      action = act.MoveTabRelative(1) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" }
  }
}

-- tab look
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)

return config
