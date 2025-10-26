local wezterm = require 'wezterm' 
local M = { }

function M.apply(config)
    -- 内边距
    config.window_padding = {
        left = 8,
        right = 8,
        top = 10,
        bottom = 7.5,
    }

    -- 窗体管理 - Window Config
    config.initial_cols = 100                  -- 初始宽度（列数）
    config.initial_rows = 28                   -- 初始高度（行数）
    config.window_background_opacity = 0.50    -- 窗口透明度（0-1）
    config.window_decorations = 'RESIZE'       -- 仅保留可缩放边框（无标题栏）
    -- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    config.hide_tab_bar_if_only_one_tab = false -- 单标签时不隐藏标签栏（与原配置一致）
    config.use_fancy_tab_bar = false            -- 启用美化标签栏（原注释写反了，已修正）
    config.window_close_confirmation = 'NeverPrompt' -- 关闭窗口不提示
    config.native_macos_fullscreen_mode = true -- macOS 原生全屏模式
    config.animation_fps = 60                  -- 动画帧率（流畅度）
    config.macos_window_background_blur = 10   -- macOS 背景模糊强度
    config.tab_max_width = 25
    config.switch_to_last_active_tab_when_closing_tab = true
    enable_tab_bar = false

    config.command_palette_fg_color = '#b4befe'
    config.command_palette_bg_color = '#262626'
    config.command_palette_font_size = 14
    config.command_palette_rows = 25
    config.adjust_window_size_when_changing_font_size = false
    config.visual_bell = {
      fade_in_function = 'EaseIn',
      fade_in_duration_ms = 250,
      fade_out_function = 'EaseOut',
      fade_out_duration_ms = 250,
      target = 'CursorColor',
   }

    -- 字体配置
    config.font_size = 18
    config.font = wezterm.font_with_fallback({  -- 这里需要用到 wezterm 变量
        'JetBrainsMono Nerd Font',          -- 主字体（等宽，支持连字）
        'Apple Color Emoji',       -- Emoji 回退（macOS 专用）
    })
    config.harfbuzz_features = { 'calt=1', 'liga=1', 'zero=1' } -- 启用连字、零宽等特性

    -- 光标配置
    config.animation_fps = 120
    config.cursor_blink_ease_in = 'EaseOut'
    config.cursor_blink_ease_out = 'EaseOut'
    config.default_cursor_style = 'BlinkingBar'
    config.cursor_blink_rate = 650
    config.cursor_thickness = 2


    -- 标签页配置
    config.tab_bar_at_bottom = true            -- 标签栏在底部
    config.show_tab_index_in_tab_bar = false   -- 不显示标签索引
    config.tab_max_width = 32                  -- 标签最大宽度

    -- 自定义标签标题
    wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
        local cwd = tab.active_pane.current_working_dir  -- 当前路径
        local dir_name = cwd and cwd.file_name or '~'     -- 提取文件夹名（默认 ~）
        local title = tab.active_pane.title               -- 进程名（如 zsh、nvim）
        local icon = tab.is_active and '●' or '○'         -- 活跃/非活跃标签图标

        -- 组合标题并截断过长内容
        local full_title = string.format(' %s %s | %s ', icon, dir_name, title)
        return { { text = wezterm.truncate_right(full_title, max_width) } }
    end)
end

return M