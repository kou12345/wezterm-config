local wezterm = require("wezterm")
local keybinds = require("keybinds")

local config = {}

-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'nord'
-- config.color_scheme = 'Black Metal (Dark Funeral) (base16)'
-- 背景透過
config.window_background_opacity = 1
-- フォントの設定
config.font = wezterm.font("HackGen", {weight="Regular", stretch="Normal", style="Normal"})
-- キーバインドの設定
config.keys = keybinds

return config
