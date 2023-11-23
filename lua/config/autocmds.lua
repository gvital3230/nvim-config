-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.Jenkinsfile,Jenkinsfile.*,Jenkinsfile" },
  callback = function()
    vim.o.filetype = "groovy"
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = { "git" },
  callback = function()
    vim.o.foldmethod = "syntax"
  end,
})
