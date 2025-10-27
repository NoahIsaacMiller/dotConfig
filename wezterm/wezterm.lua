-- WezTerm 终端配置主文件
-- 采用模块化设计，将不同功能的配置分离到 modules 目录下

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 加载配置模块（按功能逻辑顺序）
local theme = require 'modules/theme'  -- 主题配置（应首先加载）
local ui = require 'modules/ui'        -- UI基础配置
local tab = require 'modules/tab'      -- 标签页配置（应在UI配置后加载）
local keys = require 'modules/keys'    -- 按键配置

-- 应用配置（按依赖顺序应用）
theme.apply(config)
ui.apply(config)
tab.apply(config)
keys.apply(config)

wezterm.on("gui-startup", function(cmd)
    local screen = wezterm.gui.screens().active
    local ratio = 0.7 -- 这里可以根据需要调整窗口大小占屏幕的比例
    local width, height = screen.width * ratio, screen.height * ratio
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {
        position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 },
    })
    window:gui_window():set_inner_size(width, height)
end)

return config