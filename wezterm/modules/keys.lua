local wezterm = require 'wezterm'
local M = {}

function M.apply(config)
    -- 在 M.apply 函数中添加
    config.keys = {
        -- 垂直分屏（Ctrl+Shift+|）
        {
            key = '|',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        -- 水平分屏（Ctrl+Shift+-）
        {
            key = '-',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        -- 关闭当前面板（Ctrl+Shift+W）
        {
            key = 'W',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },
        -- 切换面板（Alt+方向键）
        {
            key = 'LeftArrow',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Left',
        },
        {
            key = 'RightArrow',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Right',
        },
        {
            key = 'UpArrow',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Up',
        },
        {
            key = 'DownArrow',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection 'Down',
        },
        -- 快速打开命令面板（搜索历史/命令）
        {
            key = 'P',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.ActivateCommandPalette,
        },
        -- 复制模式（类似 tmux 复制，支持鼠标选中文本自动复制）
        {
            key = 'C',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.ActivateCopyMode,
        },
        {
            key = 'L',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.ShowLauncher,  -- 基础 Launcher（标签切换+启动项）
        }
    }
end

return M
