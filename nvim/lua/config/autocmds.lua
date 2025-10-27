-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 透明背景配置
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*", -- 对所有主题生效
  callback = function()
    -- 取消背景色（设置为透明）
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- 浮动窗口透明
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" }) -- 浮动窗口边框透明
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" }) -- Telescope 透明
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" }) -- Telescope 边框透明
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" }) -- Neotree 透明（文件浏览器）
    vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "none" }) -- Neotree 边框透明
  end,
})

vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" }) -- 状态栏透明
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" }) -- 光标行透明