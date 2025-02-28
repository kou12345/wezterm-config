-- WezTermモジュールの読み込み
local wezterm = require("wezterm")
-- キーバインド設定を別ファイルから読み込み
local keybinds = require("keybinds")

-- 設定オブジェクトの初期化
local config = {}

-- エラーメッセージをより明確にするためのヘルパー関数
-- 新しいバージョンのWezTermではconfig_builderを使用
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ===== 見た目の設定 =====
-- カラースキームの設定（Nord テーマを使用）
config.color_scheme = 'nord'

-- ウィンドウの透明度設定（0.0〜1.0、小さいほど透明）
config.window_background_opacity = 0.70

-- macOSでの背景ぼかし効果の強さ（大きいほど強くぼかし効果が出る）
config.macos_window_background_blur = 20

-- ===== フォント設定 =====
-- 日本語対応フォント「HackGen」を使用
-- weight: フォントの太さ、stretch: 文字幅、style: スタイル（斜体など）
config.font = wezterm.font("HackGen", {weight="Regular", stretch="Normal", style="Normal"})

-- フォントサイズを14ポイントに設定
config.font_size = 14.0

-- ===== キーボード設定 =====
-- キーバインドを別ファイル（keybinds.lua）から読み込み
config.keys = keybinds

-- ===== ウィンドウ設定 =====
-- ウィンドウの装飾設定（「RESIZE」はリサイズ可能だがタイトルバーなし）
config.window_decorations = "RESIZE"

-- ===== タブ設定 =====
-- タブバーを有効化
config.enable_tab_bar = true
-- タブが1つしかない場合はタブバーを非表示にして画面スペースを確保
config.hide_tab_bar_if_only_one_tab = true

-- ===== macOS固有の設定 =====
-- macOSネイティブのフルスクリーンモードを使用（メニューバーと時計にアクセス可能）
config.native_macos_fullscreen_mode = true

return config
