local wezterm = require 'wezterm'

local act = wezterm.action

local M = {}

local is_macos = wezterm.target_triple:find('darwin') ~= nil

local SUPER = is_macos and 'CMD' or 'CTRL|SHIFT'

function M.apply(config)
  -- 定义leader键：按下CTRL+a触发，超时时间1000毫秒，用于前缀式快捷键
  config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

  -- 快捷键映射表：配置按键组合与对应操作的关联
  config.keys = {
    -- 水平拆分窗格：SUPER+| 触发，基于当前窗格域创建水平拆分
    { key = '\\', mods = SUPER, action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    -- 垂直拆分窗格：SUPER+- 触发，基于当前窗格域创建垂直拆分
    { key = '-', mods = SUPER, action = act.SplitVertical   { domain = 'CurrentPaneDomain' } },
    -- 关闭当前窗格：SUPER+w 触发，关闭时不弹出确认提示
    { key = 'w', mods = SUPER, action = act.CloseCurrentPane { confirm = false } },

    -- 窗格方向切换：ALT+h/j/k/l 分别触发向左/下/上/右切换激活窗格
    { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },

    -- 激活命令面板：SUPER+p 触发，呼出wezterm命令面板（可执行各类终端指令）
    { key = 'p', mods = SUPER, action = act.ActivateCommandPalette },
    -- 激活复制模式：SUPER+c 触发，进入终端内容复制的专用模式
    { key = 'c', mods = SUPER, action = act.ActivateCopyMode },
    -- 切换全屏模式：SUPER+f 触发，在全屏与普通窗口间切换
    { key = 'f', mods = SUPER, action = act.ToggleFullScreen },
    -- 新建标签页：CMD+t 触发，基于当前窗格域创建新标签页
    { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },

    -- 字体大小调整：CMD+=/-/0 分别触发增大/减小/重置字体大小
    { key = '=', mods = 'CMD', action = act.IncreaseFontSize },
    { key = '-', mods = 'CMD', action = act.DecreaseFontSize },
    { key = '0', mods = 'CMD', action = act.ResetFontSize },

    -- 数字切换标签页：CMD+数字键 切换到对应索引的标签页
    { key = '1', mods = 'CMD', action = act.ActivateTab(0) },  -- CMD+1 切换到第1个标签页（索引从0开始）
    { key = '2', mods = 'CMD', action = act.ActivateTab(1) },  -- CMD+2 切换到第2个标签页
    { key = '9', mods = 'CMD', action = act.ActivateTab(-1) }, -- CMD+9 切换到最后一个标签页（负索引表示倒数）
  }
end

-- 导出模块，供主配置文件引入并调用
return M