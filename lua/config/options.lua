-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LSP Server to use for PHP.
-- Set to "intelephense" to use intelephense instead of phpactor.
vim.g.lazyvim_php_lsp = "intelephense"

-- set the root spec to cwd
-- https://github.com/LazyVim/LazyVim/discussions/2150#discussioncomment-7787591
vim.g.root_spec = { "cwd" }
