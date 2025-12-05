local wezterm = require 'wezterm'
local M = {}

function M.apply(config)
  config.color_scheme = 'Catppuccin Mocha'

  config.colors = {
    cursor_fg = '#ffffff',
    cursor_bg = '#22c55e',
    cursor_border = '#22c55e',
    selection_bg = '#585b70',
    selection_fg = '#cdd6f4',
  }

  -- 自动跟随系统深色/浅色
  wezterm.on('window-config-reloaded', function(window, _)
    local overrides = window:get_config_overrides() or {}
    if wezterm.gui.get_appearance():find('Dark') then
      overrides.color_scheme = 'Catppuccin Mocha'
    else
      overrides.color_scheme = 'Catppuccin Mocha'
    end
    window:set_config_overrides(overrides)
  end)
end

return M