-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 显示行号
vim.opt.number = true
vim.opt.relativenumber = true  -- 相对行号

-- 缩进设置
vim.opt.tabstop = 4        -- Tab 显示为 4 空格
vim.opt.shiftwidth = 4     -- 自动缩进 4 空格
vim.opt.expandtab = true   -- Tab 转为空格

-- 搜索设置
vim.opt.ignorecase = true  -- 忽略大小写
vim.opt.smartcase = true   -- 大写字母时区分大小写