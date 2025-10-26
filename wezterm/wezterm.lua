-- 引入Wezterm API - Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--窗体管理 - Window Config
config.initial_cols = 120
config.initial_rows = 28

-- 字体 - Font
config.font_size = 18 
config.font = wezterm.font 'JetBrains Mono'

-- 配色方案 - Color scheme
config.color_scheme = 'Catppuccin Mocha'
return config

