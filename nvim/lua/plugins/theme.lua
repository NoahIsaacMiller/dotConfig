-- lua/plugins/theme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true, -- 透明背景
      integrations = {
        -- 确保集成的插件也透明（如 Telescope、Neotree 等）
        telescope = { enabled = true },
        neotree = { enabled = true, transparent_panel = true },
      },
    },
  },
}