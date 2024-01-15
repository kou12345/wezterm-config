local wezterm = require("wezterm")

local keybinds = {
    -- 現在のPaneを水平方向に半分に分割し、現在のPaneが左半分になり、新しい右半分なる
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- 現在のPaneを垂直方向に半分に分割し、現在のPaneが上半分になり、新しい下半分なる
    {
        key = 'e',
        mods = 'CMD',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Paneを上に移動する
    {
        key = 'k',
        mods = 'CMD',
        action = wezterm.action{ActivatePaneDirection = "Up"},
    },
    -- Paneを下に移動する
    {
        key = 'j',
        mods = 'CMD',
        action = wezterm.action{ActivatePaneDirection = "Down"},
    },
    -- Paneを右に移動する
    {
        key = 'l',
        mods = 'CMD',
        action = wezterm.action{ActivatePaneDirection = "Right"},
    },
    -- Paneを左に移動する
    {
        key = 'h',
        mods = 'CMD',
        action = wezterm.action{ActivatePaneDirection = "Left"},
    },
    -- Paneを削除する
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action{CloseCurrentPane = {confirm = true}},
    },
}

return keybinds
