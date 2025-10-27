-- 主题配置模块

local M = {} -- 定义模块对象

function M.apply(config)
    config.color_scheme = 'Catppuccin Mocha'
    config.colors = {
        -- cursor_bg = '#22c55e',  -- 光标颜色（绿色）
        -- cursor_fg = '#000000',  -- 光标内文字颜色（黑色，与背景对比）
        cursor_fg = '#ffffff', -- 光标内文字颜色（白色）
        -- background = 'FF6E6EB1'
    }
end

return M