-- modules/theme.lua
local M = {} -- 定义模块对象

-- 主题配置应用函数
function M.apply(config)
    -- 配色方案
    config.color_scheme = 'Catppuccin Mocha'
end

return M -- 必须返回模块对象（关键！）
