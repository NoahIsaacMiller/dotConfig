-- 引入wezterm核心模块，用于终端配置
local wezterm = require 'wezterm'
-- 初始化模块表，用于封装配置逻辑
local M = {}

-- 配置应用函数，接收配置对象作为参数，集中定义窗口相关配置
function M.apply(config)
  -- 窗口内边距：控制终端内容与窗口边框之间的间距，包含上下左右四个方向的像素值
  config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
  -- 终端初始列数：终端启动时的宽度，以字符列为单位
  config.initial_cols = 140
  -- 终端初始行数：终端启动时的高度，以字符行为单位
  config.initial_rows = 36

  -- 窗口背景不透明度：取值范围0.0（完全透明）到1.0（完全不透明），控制窗口背景的透明程度
  config.window_background_opacity = 0.2
  -- macOS窗口背景模糊：仅在macOS系统生效，数值越大模糊效果越强
  config.macos_window_background_blur = 20
  -- 窗口装饰：控制窗口显示的装饰元素，INTEGRATED_BUTTONS表示集成系统按钮，RESIZE表示保留调整大小功能
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

  -- 窗口关闭确认策略：控制关闭窗口时是否弹出确认提示，NeverPrompt表示不触发提示
  config.window_close_confirmation = "NeverPrompt"
  -- macOS原生全屏模式：仅macOS生效，启用系统原生全屏而非终端自定义全屏
  config.native_macos_fullscreen_mode = true
  -- 字体大小调整时的窗口尺寸行为：是否随字体大小变化自动调整窗口尺寸
  config.adjust_window_size_when_changing_font_size = false

  -- 命令面板字体大小：控制命令面板（Ctrl+Shift+P呼出）的字体尺寸
  config.command_palette_font_size = 15
  -- 命令面板显示行数：限制命令面板中最多展示的选项行数
  config.command_palette_rows = 12

  -- 视觉提示（视觉铃）：终端触发bell时的视觉反馈配置
  config.visual_bell = {
    fade_in_duration_ms = 150,  -- 视觉提示渐入动画时长，单位为毫秒
    fade_out_duration_ms = 150, -- 视觉提示渐出动画时长，单位为毫秒
    target = 'CursorColor',     -- 视觉提示的作用目标，此处为修改光标颜色
  }

  -- 动画帧率：控制UI动画的刷新帧率，数值越高动画越流畅，需显示器支持对应帧率
  config.animation_fps = 120
  -- 光标闪烁频率：控制光标闪烁的间隔时间，单位为毫秒，数值越大闪烁越慢
  config.cursor_blink_rate = 600
  -- 默认光标样式：可选值包含SteadyBar（常亮竖线）、Block（方块）、BlinkingBlock（闪烁方块）等
  config.default_cursor_style = 'BlinkingBar'
  -- 光标厚度：控制光标竖线的宽度，支持像素单位的数值设置
  config.cursor_thickness = "2px"
end

-- 导出模块，供主配置文件引入并调用
return M