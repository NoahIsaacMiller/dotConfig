-- UI基础配置模块

local wezterm = require 'wezterm'
local M = {}

function M.apply(config)
    -- 窗口内边距设置
    config.window_padding = {
        left = 8,
        right = 8,
        top = 20,
        bottom = 7.5,
    }

    -- 窗口管理相关配置
    config.initial_cols = 130                  -- 初始宽度（列数）
    config.initial_rows = 30                   -- 初始高度（行数）
    config.window_background_opacity = 0.60    -- 窗口透明度（0-1）
    config.window_decorations = 'RESIZE'       -- 仅保留可缩放边框
    -- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" -- 显示原生按钮和可缩放边框
    config.window_close_confirmation = 'NeverPrompt' -- 关闭窗口不提示
    config.native_macos_fullscreen_mode = true -- 启用macOS原生全屏模式
    config.macos_window_background_blur = 10   -- 高斯模糊
    config.switch_to_last_active_tab_when_closing_tab = true -- 关闭标签时切换到最后活动的标签
    config.adjust_window_size_when_changing_font_size = false -- 更改字体大小时不调整窗口大小
    
    -- 命令调色板配置
    config.command_palette_fg_color = '#ffffff' -- 命令调色板前景色
    config.command_palette_bg_color = '#313245' -- 命令调色板背景色
    config.command_palette_font_size = 18      -- 命令调色板字体大小
    config.command_palette_rows = 16           -- 命令调色板显示行数
    
    -- 视觉提示（响铃）配置
    config.visual_bell = {
      fade_in_function = 'EaseIn',      -- 淡入动画函数
      fade_in_duration_ms = 250,        -- 淡入持续时间（毫秒）
      fade_out_function = 'EaseOut',    -- 淡出动画函数
      fade_out_duration_ms = 250,       -- 淡出持续时间（毫秒）
      target = 'CursorColor',           -- 视觉提示目标（光标颜色）
   }

    -- 字体配置
    config.font_size = 14.5 -- 字体大小
    config.line_height = 0.9 -- 行高(适配Fastfetch的Ascii Art 字符高度)
    config.font = wezterm.font_with_fallback({ -- 字体回退链
        'JetBrainsMono Nerd Font',          -- 主字体（等宽，支持连字和Nerd Font图标）
        'Apple Color Emoji',                -- Emoji 回退（macOS 专用）
    })
    config.harfbuzz_features = { 'calt=1', 'liga=1', 'zero=1' } -- 启用连字、零宽和 slashed zero 特性

    -- 光标配置
    config.animation_fps = 120              -- 动画帧率（提高以获得更流畅的光标动画）
    config.cursor_blink_ease_in = 'EaseOut' -- 光标闪烁淡入动画
    config.cursor_blink_ease_out = 'EaseOut'-- 光标闪烁淡出动画
    config.default_cursor_style = 'BlinkingBar' -- 默认光标样式（闪烁条形）
    config.cursor_blink_rate = 650          -- 光标闪烁速率（毫秒）
    config.cursor_thickness = 2             -- 光标粗细
end

return M -- 返回模块对象