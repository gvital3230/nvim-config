vim.keymap.set("n", "<leader>no", "<cmd>Neorg index<cr>", { desc = "Open default workspace" })
vim.keymap.set("n", "<leader>nq", "<cmd>Neorg return<cr>", { desc = "Close notes" })
vim.keymap.set("n", "<leader>nm", "<cmd>Neorg inject-metadata<cr>", { desc = "Inject metadata" })
vim.keymap.set("n", "<leader>no", "<cmd>Neorg index<cr>", { desc = "Open default workspace" })
vim.keymap.set("n", "<leader>ng", "<cmd>Neorg generate-workspace-summary<cr>", { desc = "Generate workspace summary" })

return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.summary"] = {},
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Documents/vital/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },
}
