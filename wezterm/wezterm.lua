local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 模块加载顺序很重要！
require('modules.theme').apply(config)
require('modules.font').apply(config)
require('modules.ui').apply(config)
require('modules.tab').apply(config)
require('modules.keys').apply(config)
require('modules.launch').apply(config)

-- 优雅的启动居中
wezterm.on("gui-startup", function(cmd)
  local screen = wezterm.gui.screens().main or wezterm.gui.screens().active
  if not screen then return end

  local ratio = 0.8
  local width  = math.floor(screen.width * ratio)
  local height = math.floor(screen.height * ratio)
  local x = math.floor((screen.width - width) / 2)
  local y = math.floor((screen.height - height) / 2)

  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  local gui = window:gui_window()

  gui:set_inner_size(width, height)
  gui:set_position(x, y)
end)

return config