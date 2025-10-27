local wezterm = require 'wezterm'
local M = {}

-- 判断当前系统是否为 macOS
local is_macos = wezterm.target_triple:find('darwin') ~= nil
-- 定义基础修饰键：macOS 用 CMD，其他系统用 CTRL
local base_mod = is_macos and 'CMD' or 'CTRL'

function M.apply(config)
    -- 存储窗口默认尺寸（用于还原，改为模块级变量避免作用域问题）
    local default_window_size = nil

    -- 注册事件：记录初始尺寸
    wezterm.on('window-created', function(window)
        local dims = window:get_dimensions()
        default_window_size = { cols = dims.cols, rows = dims.rows }
        -- 存储到窗口属性，支持多窗口
        window:set_config_overrides({
            default_size = { cols = dims.cols, rows = dims.rows }
        })
    end)

    -- 快捷键配置（动态使用 CMD 或 CTRL）
    config.keys = {
        -- 垂直分屏（macOS: Cmd+Shift+|，其他: Ctrl+Shift+|）
        {
            key = '|',
            mods = base_mod .. '|SHIFT',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        -- 水平分屏（macOS: Cmd+Shift+-，其他: Ctrl+Shift+-）
        {
            key = '-',
            mods = base_mod .. '|SHIFT',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        -- 关闭当前面板（macOS: Cmd+Shift+W，其他: Ctrl+Shift+W）
        {
            key = 'W',
            mods = base_mod .. '|SHIFT',
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },
        -- 切换面板（Alt+方向键，全系统一致）
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
        -- 快速打开命令面板（macOS: Cmd+Shift+P，其他: Ctrl+Shift+P）
        {
            key = 'P',
            mods = base_mod .. '|SHIFT',
            action = wezterm.action.ActivateCommandPalette,
        },
        -- 复制模式（macOS: Cmd+Shift+C，其他: Ctrl+Shift+C）
        {
            key = 'C',
            mods = base_mod .. '|SHIFT',
            action = wezterm.action.ActivateCopyMode,
        },
        -- 基础 Launcher（macOS: Cmd+Shift+L，其他: Ctrl+Shift+L）
        {
            key = 'L',
            mods = base_mod .. '|SHIFT',
            action = wezterm.action.ShowLauncher,
        },
        -- 切换全屏模式（macOS: Cmd+Shift+F，其他: Ctrl+Shift+F）
        {
            key = 'F',
            mods = base_mod .. '|SHIFT',
            action = wezterm.action.ToggleFullScreen,
        },
        -- 调整面板大小（Alt+Shift+方向键，全系统一致）
        {
            key = 'LeftArrow',
            mods = 'ALT|SHIFT',
            action = wezterm.action.AdjustPaneSize { 'Left', 1 },
        },
        {
            key = 'RightArrow',
            mods = 'ALT|SHIFT',
            action = wezterm.action.AdjustPaneSize { 'Right', 1 },
        },
        {
            key = 'UpArrow',
            mods = 'ALT|SHIFT',
            action = wezterm.action.AdjustPaneSize { 'Up', 1 },
        },
        {
            key = 'DownArrow',
            mods = 'ALT|SHIFT',
            action = wezterm.action.AdjustPaneSize { 'Down', 1 },
        },
        -- 窗口最大化切换（macOS: Opt+UpArrow，注意按键名称修正）
        {
            key = "UpArrow",  -- 修正为大写的 UpArrow
            mods = "OPT",
            action = wezterm.action_callback(function(window, pane)
                local overrides = window:get_config_overrides() or {}
                if overrides.window_maximized == true then
                    window:restore()
                    overrides.window_maximized = false
                else
                    window:maximize()
                    overrides.window_maximized = true
                end
                window:set_config_overrides(overrides)
            end),
        },
    }
end

return M