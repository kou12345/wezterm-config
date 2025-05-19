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

-- macOSでの背景ぼかし効果の強さ
config.macos_window_background_blur = 80

-- ===== 背景レイヤーの設定 =====
config.background = {
  -- 背景画像レイヤー 
    {
    source = {
      File = "/Users/koichiro-hira/.config/wezterm/gengar-wallpaper.jpg"
    },
    -- 画像レイヤーの透明度 (元の設定に近い値)
    opacity = 0.7,
    -- 必要に応じて画像の配置やサイズ調整オプションを追加できます
    -- 例: 画像をウィンドウに合わせて引き伸ばす場合
    width = "Cover",
    height = "Cover",
  },
  -- グラデーションレイヤー
  {
    source = {
      Gradient = {
        colors = { "#1B093F", "#080710" },
        -- orientation でグラデーションの方向を指定
        orientation = {
          Linear = { angle = 45.0 }, -- 線形グラデーション (角度はお好みで)
        },
      },
    },
    opacity = 0.6, -- グラデーション自体は不透明にしておくことが多い
    width = "100%", -- ウィンドウ幅全体に広げる
    height = "100%", -- ウィンドウ高全体に広げる
  },
}


-- ===== フォント設定 =====
-- 日本語対応フォント「HackGen」を使用
config.font = wezterm.font("HackGen", {weight="Regular", stretch="Normal", style="Normal"})
-- フォントサイズを14ポイントに設定
config.font_size = 14.0

-- ===== キーボード設定 =====
-- キーバインドを別ファイル（keybinds.lua）から読み込み
config.keys = keybinds

-- ===== ウィンドウ設定 =====
-- ウィンドウの装飾設定
config.window_decorations = "RESIZE"

-- ===== タブ設定 =====
-- タブバーを有効化
config.enable_tab_bar = true
-- タブが1つしかない場合はタブバーを非表示
config.hide_tab_bar_if_only_one_tab = true

-- ===== macOS固有の設定 =====
-- macOSネイティブのフルスクリーンモードを使用
config.native_macos_fullscreen_mode = true

return config