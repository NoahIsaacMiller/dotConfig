local wezterm = require 'wezterm'
local M = {}

function M.apply(config)
  config.window_decorations = "RESIZE" 
  
  -- 标签栏配置
  config.enable_tab_bar = true
  config.hide_tab_bar_if_only_one_tab = true
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = false
  config.tab_max_width = 40

  -- 标签标题格式化函数
  wezterm.on('format-tab-title', function(tab, tabs, panes, cfg, hover, max_width)
    local edge_bg = tab.is_active and '#89b4fa' or '#585b70'
    local bg = tab.is_active and '#313244' or '#1e1e2e'
    local fg = tab.is_active and '#cdd6f4' or '#a6adc8'
    local edge_fg = edge_bg

    local dir = tab.active_pane.current_working_dir.file_name '～'
    local proc = tab.active_pane.foreground_process_name:match('[^/\\]+$') 'shell'

    local title = string.format('  %s · %s  ', dir, proc)

    return {
      { Background = { Color = edge_bg } },
      { Text = ' ' },
      { Background = { Color = bg } },
      { Foreground = { Color = fg } },
      { Text = title },
      { Background = { Color = edge_bg } },
      { Foreground = { Color = edge_fg } },
      { Text = ' ' },
    }
  end)
end

return M