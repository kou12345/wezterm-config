local wezterm = require("wezterm")
local keybinds = require("keybinds")

local config = {}

-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- 任意の画像path
config.window_background_image = ""
config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.3,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

-- カラースキームの設定
-- config.color_scheme = 'nord'
-- config.color_scheme = 'Black Metal (Dark Funeral) (base16)'
-- 背景透過
config.window_background_opacity = 0.70
-- ぼかしの設定
config.macos_window_background_blur = 20
-- フォントの設定
config.font = wezterm.font("HackGen", {weight="Regular", stretch="Normal", style="Normal"})
-- キーバインドの設定
config.keys = keybinds

-- タブの設定
config.window_decorations = "RESIZE"
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

config.show_new_tab_button_in_tab_bar = false
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
local background = "#5c6d74"
local foreground = "#FFFFFF"
  local edge_background = "none"
if tab.is_active then
  background = "#ae8b2d"
  foreground = "#FFFFFF"
end
  local edge_foreground = background
local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
   { Background = { Color = background } },
   { Foreground = { Color = foreground } },
  { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
}
end)


return config
