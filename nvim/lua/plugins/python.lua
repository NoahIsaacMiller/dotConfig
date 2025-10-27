return {
  -- 语法高亮和LSP支持
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},  -- Python LSP
      },
    },
  },
  -- 代码补全（依赖 nvim-cmp）
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP 补全源
      "hrsh7th/cmp-path",      -- 路径补全
    },
  },
}