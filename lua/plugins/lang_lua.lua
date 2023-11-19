vim.keymap.set("n", "<F5>", "<cmd>lua require'osv'.launch({port = 8086})<CR>", { desc = "Launch lua DAP server" })

return {
  { import = "lazyvim.plugins.extras.dap.nlua" },
}
