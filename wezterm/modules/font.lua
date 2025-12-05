-- 引入wezterm核心模块，用于终端配置
local wezterm = require 'wezterm'
-- 初始化模块表，封装字体相关配置逻辑
local M = {}

-- 配置应用函数，接收配置对象，集中定义字体相关配置
function M.apply(config)
  -- 字体回退列表：终端会优先使用列表靠前的字体，无法渲染的字符自动使用后续字体兜底
  config.font = wezterm.font_with_fallback {
    'mononoki',                  -- 主字体
    "JetBrainsMono Nerd Font",   -- Nerd Font适配的JetBrains Mono，支持图标字符
    "Aa偷吃可爱长大的",         
    "JetBrains Mono",            -- 备用等宽字体
    { family = "Noto Color Emoji", scale = 0.9 },        -- 彩色emoji字体，缩放0.9避免过大
    "Apple Symbols",             -- macOS系统符号字体（适配系统特殊字符）
  }

  -- 字体大小：根据系统动态适配，macOS下使用更大的字号，其他系统使用较小字号
  config.font_size = wezterm.target_triple:find("darwin") and 18.0 or 13.0
  -- 行高：控制文字行之间的垂直间距，1.0为默认行高，大于1.0增加行间距
  config.line_height = 1.0
  -- 单元格宽度：控制字符单元格的宽度比例，1.0为默认宽度，不缩放字符宽度
  config.cell_width = 1.0

  -- HarfBuzz排版引擎特性：启用连字、上下文替代、零宽连字、零数字样式等排版优化
  config.harfbuzz_features = { "calt", "clig", "liga", "zero" }
  -- FreeType字体加载目标：Light模式侧重字体清晰度，降低渲染强度，提升显示流畅度
  config.freetype_load_target = "Light"
end

-- 导出模块，供主配置文件引入并调用
return M