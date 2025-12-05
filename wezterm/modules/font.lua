-- ~/.config/wezterm/modules/font.lua
local wezterm = require 'wezterm'
local M = {}

function M.apply(config)
  config.font = wezterm.font_with_fallback {
    -- 主字体（强烈推荐装这个！）
    { family = 'JetBrains Mono',         weight = 'Regular',  scale = 1.0 },
    { family = 'Blex Mono Nerd Font',    weight = 'Regular' },     -- 图标补全
    { family = 'Symbols Nerd Font',      scale = 0.0 },         -- 更多图标
    { family = 'Noto Color Emoji',       scale = 0.9 },            -- 彩色 emoji
    'Apple Symbols',                                               -- macOS 专属符号
  }

  config.font_size = 14.5           -- macOS 推荐 14~15，Windows/Linux 可以改成 12~13
  config.line_height = 1.1
  config.cell_width = 1.0

  -- 超清晰抗锯齿 + 连字（ligatures）支持
  config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
  config.freetype_load_target = 'HorizontalLcd'   -- 更好渲染
  config.freetype_render_target = 'HorizontalLcd'
end

return M