local wezterm = require 'wezterm'
local M = {}

function M.apply(config)
    config.enable_tab_bar = false
    config.use_fancy_tab_bar = false
    config.tab_bar_at_bottom = true
    config.hide_tab_bar_if_only_one_tab = false
    config.show_new_tab_button_in_tab_bar = true

    wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
        local left_rounded = wezterm.nerdfonts.ple_left_half_circle_thick -- 
        local right_rounded = wezterm.nerdfonts.ple_right_half_circle_thick -- 

        local edge_bg = tab.is_active and '#313244' or '#1e1e2e'
        local hover_edge_bg = hover and '#272738' or edge_bg

        local dir = tab.active_pane.current_working_dir.file_name or '~'
        local process = tab.active_pane.title:match('([^/]+)$') or 'term'

        -- 通过换行符 \n 增加上下内边距，间接提高标签栏高度
        local content = string.format('\n %s · %s \n', dir, process)

        local rounded_title = string.format(
            '%s%s%s',
            wezterm.format({ { Background = { Color = hover_edge_bg } }, { Text = left_rounded } }),
            content,
            wezterm.format({ { Background = { Color = hover_edge_bg } }, { Text = right_rounded } })
        )

        return { { Text = wezterm.truncate_right(rounded_title, max_width - 2) } }
    end)
end

return M
